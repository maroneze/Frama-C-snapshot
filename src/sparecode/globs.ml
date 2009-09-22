(**************************************************************************)
(*                                                                        *)
(*  This file is part of Frama-C.                                         *)
(*                                                                        *)
(*  Copyright (C) 2007-2009                                               *)
(*    CEA   (Commissariat � l'�nergie Atomique)                           *)
(*    INRIA (Institut National de Recherche en Informatique et en         *)
(*           Automatique)                                                 *)
(*                                                                        *)
(*  you can redistribute it and/or modify it under the terms of the GNU   *)
(*  Lesser General Public License as published by the Free Software       *)
(*  Foundation, version 2.1.                                              *)
(*                                                                        *)
(*  It is distributed in the hope that it will be useful,                 *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU Lesser General Public License for more details.                   *)
(*                                                                        *)
(*  See the GNU Lesser General Public License version v2.1                *)
(*  for more details (enclosed in the file licenses/LGPLv2.1).            *)
(*                                                                        *)
(**************************************************************************)

open Cil_types
open Cilutil
open Cil

let debug format = Sparecode_params.debug ~level:2 format

let used_variables = Hashtbl.create 123
let var_init = Hashtbl.create 123
let used_typeinfo = Hashtbl.create 123
let used_compinfo = Hashtbl.create 123
let used_enuminfo = Hashtbl.create 123

let clear_tables () =
  Hashtbl.clear used_variables;
  Hashtbl.clear var_init;
  Hashtbl.clear used_typeinfo;
  Hashtbl.clear used_compinfo;
  Hashtbl.clear used_enuminfo

class collect_visitor = object (self)

  inherit Visitor.generic_frama_c_visitor
    (Project.current()) (Cil.inplace_visit ())

  method vtype t = match t with
    | TNamed(ti,_) ->
        (* we use the type name because directe typeinfo comparision
        * doesn't wok. Anyway, CIL renames types if several type have the same
        * name... *)
        if Hashtbl.mem used_typeinfo ti.tname then SkipChildren
        else begin
          debug "[sparecode:globs] add used typedef %s@." ti.tname;
          Hashtbl.add used_typeinfo ti.tname ();
          ignore (visitCilType (self:>Cil.cilVisitor) ti.ttype);
          DoChildren
        end
    | TEnum(ei,_) ->
        if Hashtbl.mem used_enuminfo ei.ename then SkipChildren
        else begin
          debug "[sparecode:globs] add used enum %s@." ei.ename;
          Hashtbl.add used_enuminfo ei.ename (); DoChildren
        end
    | TComp(ci,_,_) ->
        if Hashtbl.mem used_compinfo ci.cname then SkipChildren
        else begin
          debug "[sparecode:globs] add used comp %s@." ci.cname;
          Hashtbl.add used_compinfo ci.cname ();
          List.iter
            (fun f -> ignore (visitCilType (self:>Cil.cilVisitor) f.ftype))
            ci.cfields;
          DoChildren
        end
    | _ -> DoChildren

  method vvrbl v =
    if v.vglob && not (Hashtbl.mem used_variables v) then begin
      debug "[sparecode:globs] add used var %s@." v.vname;
      Hashtbl.add used_variables v ();
      ignore (visitCilType (self:>Cil.cilVisitor) v.vtype);
      try
        let init = Hashtbl.find var_init v in
          ignore (visitCilInit (self:>Cil.cilVisitor) v NoOffset init)
      with Not_found -> ()
    end;
    DoChildren

  method vglob_aux g = match g with
    | GFun (f, _) ->
        debug "[sparecode:globs] add function %s@." f.svar.vname;
        Hashtbl.add used_variables f.svar ();
        Cil.DoChildren
    | GAnnot _ -> Cil.DoChildren
    | GVar (v, init, _) ->
        (match init.init with None -> ()
                            | Some i -> Hashtbl.add var_init v i);
        Cil.SkipChildren
    | _ -> Cil.SkipChildren

end

class filter_visitor  prj = object

  inherit Visitor.generic_frama_c_visitor prj (Cil.copy_visit())

  method vglob_aux g =
    match g with
      | GFun (_f, _loc) (* function definition *)
        -> Cil.DoChildren (* keep everything *)
      | GVar (v, _, _loc) (* variable definition *)
      | GVarDecl (_, v, _loc) -> (* variable/function declaration *)
          if Hashtbl.mem used_variables v then DoChildren
          else begin
            debug "[sparecode:globs] remove var %s@." v.vname;
            ChangeTo []
          end
      | GType (ti, _loc) (* typedef *) ->
          if Hashtbl.mem used_typeinfo ti.tname then DoChildren
          else begin
            debug "[sparecode:globs] remove typedef %s@." ti.tname;
            ChangeTo []
          end
      | GCompTag (ci, _loc) (* struct/union definition *)
      | GCompTagDecl (ci, _loc) (* struct/union declaration *) ->
          if Hashtbl.mem used_compinfo ci.cname then DoChildren
          else begin
            debug "[sparecode:globs] remove comp %s@." ci.cname;
            ChangeTo []
          end
      | GEnumTag (ei, _loc) (* enum definition *)
      | GEnumTagDecl (ei, _loc) (* enum declaration *) ->
          if Hashtbl.mem used_enuminfo ei.ename then DoChildren
          else begin
            debug "[sparecode:globs] remove enum %s@." ei.ename;
            DoChildren (* ChangeTo [] *)
          end
      | _ -> Cil.DoChildren
  end

module Result = 
  Computation.Hashtbl
    (Datatype.String)
    (Datatype.Project)
    (struct 
       let name = "Sparecode.Globs.Result" 
       let size = 7
       let dependencies = [] 
     end)

let rm_unused_decl =
  Result.memo
    (fun new_proj_name ->
       clear_tables ();
       let visitor = new collect_visitor in
       ignore
	 (Visitor.visitFramacFile
	    (visitor:>Visitor.frama_c_visitor) (Ast.get ()));
       debug "[sparecode:globs] filtering done@.";
       let visitor = new filter_visitor in
       let new_prj = File.create_project_from_visitor new_proj_name visitor in
       let ctx = Parameters.get_selection_context () in
       Project.copy ~only:ctx new_prj;
       new_prj)

(*
Local Variables:
compile-command: "make -C ../.."
End:
*)