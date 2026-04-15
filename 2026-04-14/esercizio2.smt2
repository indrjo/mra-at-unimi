
;; esercizio 2

;; We have a list of four elements: a0, a1, a2, a3
(declare-const a0 Int)
(declare-const a1 Int)
(declare-const a2 Int)
(declare-const a3 Int)

;; Initial state: r0 = 0
(declare-const r0 Int)
(assert (= r0 0))

;; I=1, J=0
(declare-const r1 Int)
(assert (= r1 (if (= a1 a0) 1 r0)))

;; I=2, J=1
(declare-const r2 Int)
(assert (= r2 (if (= a2 a1) 1 r1)))

;; I=2, J=0
(declare-const r3 Int)
(assert (= r3 (if (= a2 a0) 1 r2)))

;; I=3, J=2
(declare-const r4 Int)
(assert (= r4 (if (= a3 a2) 1 r3)))

;; I=3, J=1
(declare-const r5 Int)
(assert (= r5 (if (= a3 a1) 1 r4)))

;; I=3, J=0
(declare-const r6 Int)
(assert (= r6 (if (= a3 a0) 1 r5)))

(assert
 (not 
  (=> (= r6 0) 
      (and (not (= a0 a1)) (not (= a0 a2)) (not (= a0 a3))
           (not (= a1 a2)) (not (= a1 a3))
           (not (= a2 a3))))))

(check-sat)

