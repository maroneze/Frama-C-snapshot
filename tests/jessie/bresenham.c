
/**************************************************************************/
/*                                                                        */
/* Proof of the Bresenham line drawing algorithm.                         */
/* (see examples/bresenham/ for the Why proof)                            */
/*                                                                        */
/* Jean-Christophe Filli�tre (LRI, Universit� Paris Sud)                  */
/* June 2008                                                              */
/*                                                                        */
/**************************************************************************/

int x2, y2;

//@ global invariant first_octant : 0 <= y2 <= x2;
//@ axiom ax_first_octant{Here} : 0 <= y2 <= x2;

//@ logic integer abs(integer x);

/*@ axiom abs_def: 
  @   \forall int x; (x >= 0 && abs(x) == x) || (x <= 0 && abs(x) == -x);
  @*/

/*@ predicate best{Here}(int x, int y) =
  @   \forall int yp; abs(x2 * y - x * y2) <= abs (x2 * yp - x * y2)
  @ ; */

/*@ predicate Invariant{Here}(int x, int y, int e) =
  @   e == 2 * (x + 1) * y2 - (2 * y + 1) * x2 &&
  @   2 * (y2 - x2) <= e <= 2 * y2
  @ ; */

/*@ axiom invariant_is_ok{Here} : 
  @  \forall int x, int y, int e; Invariant(x,y,e) ==> best(x,y);
  @*/

//@ axiom z_ring_0 : \forall int a, int b, int c; a * (b+c) == a*b + a*c;
//@ axiom z_ring_1 : \forall int a, int b, int c; (b+c) * a == b*a + c*a;

void bresenham() {
  int x = 0;
  int y = 0;
  int e = 2 * y2 - x2;
  /*@ loop invariant 0 <= x <= x2 + 1 && Invariant(x,y,e);
    @ loop variant x2 - x;
    @*/
  for (x = 0; x <= x2; x++) {
    // plot (x,y) at this point
    //@ assert best(x,y);
    if (e < 0)
      e += 2 * y2;
    else {
      y++;
      e += 2 * (y2 - x2);
    }
  }
}

/* 
Local Variables:
compile-command: "PPCHOME=../.. LC_ALL=C make bresenham"
End:
*/