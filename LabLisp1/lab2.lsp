(defun preordine(arb)
    (cond
        ((null arb) nil)
        (t (append (list (car arb)) (preordine (cadr arb)) (preordine (caddr arb))))))

(print (preordine `(a (b (d)) (c (g)))))
(print (preordine `(1 (2 (4) (7)) (3 (5) (6)))))