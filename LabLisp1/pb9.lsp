(defun contine(e l)
    (cond
        ((null l) nil)
        ((/= (car l) e) (contine e (cdr l)))
        (t)))
(print (contine `5 `(1 2 3 4 5)))
(terpri )

(defun dif_mult(L B)
    (cond 
        ((null L) nil)
        ((not (contine (car L) B)) (cons (car L) (dif_mult (cdr L) B)))
        (t (dif_mult (cdr L) B))))

(princ "9/(a) = diferenta a 2 multimi")
(print (dif_mult `(1 2 3 4) `(1 2 3 5 6)))
(print (dif_mult `(1 2 3 4 5) `(2 4 3 6)))
(terpri )

(defun inv(b)
    (cond
        ((null b) nil)
        ((atom b) b)
        ((list (car b)) (append (inv (cdr b)) (list (inv (car b)))))
        (t (append (inv (cdr b)) (list (car b))))))

(princ "9/(b) = inversul unei liste")
(print (inv `(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))
(terpri )

(defun suma(l)
    (cond
        ((null l) 0)
        ((numberp (car l)) (+ (car l) (suma (cdr l))))
        (t (suma (cdr l)))))

(princ "9/(d) = suma la nivel superficial")
(print (suma `(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))
(print (suma '(1 (2 (3 4) 5) 1)))
(terpri )

(defun lista_prim_aux(l)
    (cond
        ((or (atom l) (null l)) nil)
        ((oddp (length l)) (cons (car l) (apply `append (mapcar `lista_prim_aux(cdr l)))))
        ;((oddp (length l)) (cons (car l) (mapcan `lista_prim_aux (cdr l))))
        (t (apply `append (mapcar `lista_prim_aux(cdr l))))))
        ;(t (mapcan `lista_prim_aux (cdr l)))))

(princ "9/(c) = primele elemente ale listelor de lungime impara")
(print (lista_prim_aux `(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))
(print (lista_prim_aux `((1 (2 3) 4 5) (3 (4 5) (6 7)) 8 (9 10 11))))

(defun lista_prim(l)
    (cond
        ((or (atom l) (null l)) nil)
        ((oddp (length l)) (cons (car l) (lista_prim (cdr l))))
        (t (lista_prim (cdr l)))))

;(print (lista_prim `((1 (2 3) 4 5) (3 (4 5) (6 7)) 8 (9 10 11))))
;(print (lista_prim `(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))
