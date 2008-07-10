(* This file was originally generated by why.
   It can be modified; only the generated parts will be overwritten. *)

Require Export flag_spec_why.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_1 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  (* File "flag.c", line 33, characters 7-210 *)
  ((((((((forall (k:Z),
          (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))) /\
  0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
  (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
  (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
  (isMonochrome intM_global alloc t n (n - 1) RED)).
Proof.
intuition.
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_2 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_4: i < r),
  forall (result: ((pointer) global)),
  forall (HW_5: result = (shift t i)),
  (valid alloc result).
Proof.
intuition.
unfold assigns in *|-*.
intros.
rewrite H16;auto.
subst.
generalize (unchanged_range_elim p t 0 n H18);auto.
subst.
assert (k=b1 \/ k = i1 \/ (k<> b1 /\ k <>i1)).
omega.
intuition.
subst.
rewrite H14.
intuition.
subst.
rewrite H17;intuition.
rewrite H16;intuition.
red;subst;intuition.
unfold valid_range in *|-*; intuition.
assert (k=b1 \/ k < b1 ).
omega.
intuition.
subst.
rewrite H14.
auto.
rewrite H16;auto.
red in H7;intuition.
red;subst;intuition.
unfold valid_range in *|-*; intuition.
assert (k=i1 \/ k < i1 ).
omega.
intuition.
subst.
rewrite H17.
red in H6;intuition.
rewrite H16;auto.
red in H6;intuition.
red;subst;intuition.
unfold valid_range in *|-*; intuition.
rewrite H16;auto.
red in H5;intuition.
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_3 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_4: i < r),
  forall (result: ((pointer) global)),
  forall (HW_5: result = (shift t i)),
  forall (HW_6: (valid alloc result)),
  forall (result0: Z),
  forall (HW_7: result0 = (acc intM_global0 result)),
  forall (HW_8: result0 = BLUE),
  forall (b0: Z),
  forall (HW_9: b0 = (b + 1)),
  forall (i0: Z),
  forall (HW_10: i0 = (i + 1)),
  (* File "flag.c", line 12, characters 14-52 *) ((valid_index alloc t b) /\
  (valid_index alloc t i)).
Proof.
intuition.
subst.
red;subst;intuition.
unfold valid_range in *|-*;intuition.
assert (k=i1 \/ k<i1).
omega.
intuition.
subst.
auto.
red in H6;intuition.
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_4 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_4: i < r),
  forall (result: ((pointer) global)),
  forall (HW_5: result = (shift t i)),
  forall (HW_6: (valid alloc result)),
  forall (result0: Z),
  forall (HW_7: result0 = (acc intM_global0 result)),
  forall (HW_8: result0 = BLUE),
  forall (b0: Z),
  forall (HW_9: b0 = (b + 1)),
  forall (i0: Z),
  forall (HW_10: i0 = (i + 1)),
  forall (HW_11: (* File "flag.c", line 12, characters 14-52 *)
                 ((valid_index alloc t b) /\ (valid_index alloc t i))),
  forall (intM_global1: ((memory) Z global)),
  forall (HW_12: (* File "flag.c", line 14, characters 13-53 *)
                 ((acc intM_global1 (shift t b)) =
                 (acc intM_global0 (shift t i)) /\
                 (acc intM_global1 (shift t i)) =
                 (acc intM_global0 (shift t b))) /\
                 (not_assigns alloc intM_global0 intM_global1
                  (pset_union (pset_singleton (shift t i))
                   (pset_singleton (shift t b))))),
  (* File "flag.c", line 33, characters 7-210 *)
  ((((((((forall (k:Z),
          (0 <= k /\ k < n -> (isColor (acc intM_global1 (shift t k))))) /\
  0 <= b0) /\ b0 <= i0) /\ i0 <= r) /\ r <= n) /\
  (isMonochrome intM_global1 alloc t 0 (b0 - 1) BLUE)) /\
  (isMonochrome intM_global1 alloc t b0 (i0 - 1) WHITE)) /\
  (isMonochrome intM_global1 alloc t r (n - 1) RED)) /\
  (Zwf 0 (r - i0) (r - i)).
Proof.
intuition.
unfold assigns in *|-*.
intros.
rewrite H13;auto.
subst.
generalize (unchanged_range_elim p t 0 n H15);auto.
subst.
assert (k=(r1-1) \/ k = i1 \/ (k<> (r1-1) /\ k <>i1)).
omega.
intuition.
subst.
rewrite H3;intuition.
subst;rewrite H14;intuition.
rewrite H13;intuition.
red;subst;intuition.
unfold valid_range in *|-*; intuition.
assert (k=i1 \/ k < i1 ).
omega.
intuition.
rewrite H13;intuition.
red in H7;intuition.
red;subst;intuition.
unfold valid_range in *|-*; intuition.
assert (k=r1-1 \/ k < r1-1).
omega.
intuition.
rewrite H13;intuition.
red in H6;intuition.
red;subst;intuition.
unfold valid_range in *|-*; intuition.
assert (k=(r1-1) \/ k >= r1).
omega.
intuition.
subst;rewrite H3;intuition.
rewrite H13;intuition.
red in H5;intuition.
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_5 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_4: i < r),
  forall (result: ((pointer) global)),
  forall (HW_5: result = (shift t i)),
  forall (HW_6: (valid alloc result)),
  forall (result0: Z),
  forall (HW_7: result0 = (acc intM_global0 result)),
  forall (HW_13: result0 <> BLUE),
  forall (HW_14: result0 = WHITE),
  forall (i0: Z),
  forall (HW_15: i0 = (i + 1)),
  (* File "flag.c", line 33, characters 7-210 *)
  ((((((((forall (k:Z),
          (0 <= k /\ k < n -> (isColor (acc intM_global0 (shift t k))))) /\
  0 <= b) /\ b <= i0) /\ i0 <= r) /\ r <= n) /\
  (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
  (isMonochrome intM_global0 alloc t b (i0 - 1) WHITE)) /\
  (isMonochrome intM_global0 alloc t r (n - 1) RED)) /\
  (Zwf 0 (r - i0) (r - i)).
Proof.
intuition.
elimtype False.
assert (isColor (shift t i1 # intP0)).
intuition.
red in H3;subst;intuition.
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_6 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_4: i < r),
  forall (result: ((pointer) global)),
  forall (HW_5: result = (shift t i)),
  forall (HW_6: (valid alloc result)),
  forall (result0: Z),
  forall (HW_7: result0 = (acc intM_global0 result)),
  forall (HW_13: result0 <> BLUE),
  forall (HW_16: result0 <> WHITE),
  forall (HW_17: result0 = RED),
  forall (r0: Z),
  forall (HW_18: r0 = (r - 1)),
  (* File "flag.c", line 12, characters 14-52 *) ((valid_index alloc t r0) /\
  (valid_index alloc t i)).
Proof.
intuition.
assert (i1=r1).
omega.
subst.
exists b1;exists r1;intuition.
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_7 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_4: i < r),
  forall (result: ((pointer) global)),
  forall (HW_5: result = (shift t i)),
  forall (HW_6: (valid alloc result)),
  forall (result0: Z),
  forall (HW_7: result0 = (acc intM_global0 result)),
  forall (HW_13: result0 <> BLUE),
  forall (HW_16: result0 <> WHITE),
  forall (HW_17: result0 = RED),
  forall (r0: Z),
  forall (HW_18: r0 = (r - 1)),
  forall (HW_19: (* File "flag.c", line 12, characters 14-52 *)
                 ((valid_index alloc t r0) /\ (valid_index alloc t i))),
  forall (intM_global1: ((memory) Z global)),
  forall (HW_20: (* File "flag.c", line 14, characters 13-53 *)
                 ((acc intM_global1 (shift t r0)) =
                 (acc intM_global0 (shift t i)) /\
                 (acc intM_global1 (shift t i)) =
                 (acc intM_global0 (shift t r0))) /\
                 (not_assigns alloc intM_global0 intM_global1
                  (pset_union (pset_singleton (shift t i))
                   (pset_singleton (shift t r0))))),
  (* File "flag.c", line 33, characters 7-210 *)
  ((((((((forall (k:Z),
          (0 <= k /\ k < n -> (isColor (acc intM_global1 (shift t k))))) /\
  0 <= b) /\ b <= i) /\ i <= r0) /\ r0 <= n) /\
  (isMonochrome intM_global1 alloc t 0 (b - 1) BLUE)) /\
  (isMonochrome intM_global1 alloc t b (i - 1) WHITE)) /\
  (isMonochrome intM_global1 alloc t r0 (n - 1) RED)) /\
  (Zwf 0 (r0 - i) (r - i)).
Proof.
intuition; subst; unfold isMonochrome; intuition;
red in H2; red;intuition.
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_8 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_4: i < r),
  forall (result: ((pointer) global)),
  forall (HW_5: result = (shift t i)),
  forall (HW_6: (valid alloc result)),
  forall (result0: Z),
  forall (HW_7: result0 = (acc intM_global0 result)),
  forall (HW_13: result0 <> BLUE),
  forall (HW_16: result0 <> WHITE),
  forall (HW_21: result0 <> RED),
  (* File "flag.c", line 33, characters 7-210 *)
  ((((((((forall (k:Z),
          (0 <= k /\ k < n -> (isColor (acc intM_global0 (shift t k))))) /\
  0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
  (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
  (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
  (isMonochrome intM_global0 alloc t r (n - 1) RED)) /\
  (Zwf 0 (r - i) (r - i)).
Proof.
intuition.
(* FILL PROOF HERE *)
Save.

(* Why obligation from file "", line 0, characters 0-0: *)
(*Why goal*) Lemma flag_impl_po_9 : 
  forall (t: ((pointer) global)),
  forall (n: Z),
  forall (alloc: alloc_table),
  forall (intM_global: ((memory) Z global)),
  forall (HW_1: (* File "flag.c", line 18, characters 14-106 *) ((n >= 0 /\
                (valid_range alloc t 0 (n - 1))) /\
                (forall (k:Z),
                 (0 <= k /\ k < n -> (isColor (acc intM_global (shift t k))))))),
  forall (HW_2: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global (shift t k))))) /\
                0 <= 0) /\ 0 <= 0) /\ 0 <= n) /\ n <= n) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) BLUE)) /\
                (isMonochrome intM_global alloc t 0 (0 - 1) WHITE)) /\
                (isMonochrome intM_global alloc t n (n - 1) RED))),
  forall (b: Z),
  forall (i: Z),
  forall (intM_global0: ((memory) Z global)),
  forall (r: Z),
  forall (HW_3: (* File "flag.c", line 33, characters 7-210 *)
                ((((((((forall (k:Z),
                        (0 <= k /\ k < n ->
                         (isColor (acc intM_global0 (shift t k))))) /\
                0 <= b) /\ b <= i) /\ i <= r) /\ r <= n) /\
                (isMonochrome intM_global0 alloc t 0 (b - 1) BLUE)) /\
                (isMonochrome intM_global0 alloc t b (i - 1) WHITE)) /\
                (isMonochrome intM_global0 alloc t r (n - 1) RED))),
  forall (HW_22: i >= r),
  (* File "flag.c", line 23, characters 6-126 *)
  (exists b:Z,
   (exists r:Z, ((isMonochrome intM_global0 alloc t 0 (b - 1) BLUE) /\
    (isMonochrome intM_global0 alloc t b (r - 1) WHITE)) /\
    (isMonochrome intM_global0 alloc t r (n - 1) RED))) /\
  (not_assigns alloc intM_global intM_global0
   (pset_range (pset_singleton t) 0 (n - 1))).
Proof.
intuition.
(* FILL PROOF HERE *)
Save.
