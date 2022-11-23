(defun dif_mult(L B)
    (cond 
        ((null L) B)
        ((null B) L)
        ((equal (car L) (car B)) (dif_mult(cdr L) (cdr B)))
        (t (cons (car L) (dif_mult(cdr L) B))) 
    )
)

(defun invers(l)
    (cond 
        ((null l) nil)
        ((atom l) l)
        (t (append (invers (cdr l)) (list (car l))))
    )
)

(defun inv(b)
    (cond
        ((null b) nil)
        ((atom b) b)
        ((list (car b)) (append (inv(cdr b)) (list (inv(car b)))))
        ;((list (car b)) (append (inv(cdr b)) (list (invers(car b)))))
        (t (append (inv (cdr b)) (list (car b))))
    )
)


