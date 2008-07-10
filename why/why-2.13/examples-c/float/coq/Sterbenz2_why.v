(* This file was originally generated by why.
   It can be modified; only the generated parts will be overwritten. *)

Require Export Sterbenz2_spec_why.
Require Export WhyFloats.


Lemma Rabs_RO_sub: forall (a b:R), (Rabs (a-b)=0)%R -> a=b.
intros.
case (Req_dec (a-b) 0); auto with real.
intros H1; Contradict H; apply Rabs_no_R0; auto.
Qed.


(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma Sterbenz_impl_po_1 : 
  forall (x: double),
  forall (y: double),
  forall (HW_1: (* File "Sterbenz2.c", line 1, characters 14-73 *)
                ((((Rle (Rdiv (d_to_r y) (IZR 2)) (d_to_r x)) /\
                (Rle (d_to_r x) (Rmult (IZR 2) (d_to_r y)))) /\
                (eq (double_round_error x) (IZR 0))) /\
                (eq (double_round_error y) (IZR 0)))),
  (eq (double_round_error (sub_double nearest_even x y)) (IZR 0)).
Proof.
intros x y; unfold double_round_error, d_to_r; destruct x; destruct y; simpl.
intros T; elim T; intros T' H1; elim T'; intros H2 H3; clear T T'.
rewrite Rabs_RO_sub with (1:=H1).
rewrite Rabs_RO_sub with (1:=H3).
replace (FtoRradix (RND_EvenClosest bdouble radix 53 (df - df0))) with
   (df-df0)%R; [ring (df - df0 - (df - df0))%R; apply Rabs_R0|idtac].
unfold FtoRradix; rewrite <- Fminus_correct; auto with zarith.
apply RoundedModeProjectorIdemEq with bdouble 53%nat (EvenClosest bdouble radix 53); auto with zarith.
apply Sterbenz; auto with zarith real.
elim H2; intros W1 W2; fold FtoRradix; apply Rle_trans with (2:=W1).
simpl; right; unfold Rdiv; auto with real.
elim H2; intros W1 W2; fold FtoRradix; apply Rle_trans with (1:=W2).
simpl; right; auto with real.
Save.
