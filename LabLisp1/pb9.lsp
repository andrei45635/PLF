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
        (t (append (inv (cdr b)) (list (car b))))
    )
)

(defun suma(l)
    (cond
        ((null l) 0)
        ((numberp (car l)) (+ (car l) (suma(cdr l))))
        (t (suma (cdr l)))
    )
)

(defun lista_prim(l)
    (cond
        ((atom l) l)
        ((oddp (length l)) (cons (caar l) (lista_prim(cdr l))))
        (t (lista_prim (cdr l)))
    )
)
