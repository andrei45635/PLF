(defun dif_mult(L B)
    (cond 
        ((null L) B)
        ((null B) L)
        ((equal (car L) (car B)) (dif_mult (cdr L) (cdr B)))
        (t (cons (car L) (dif_mult (cdr L) B)))))

(princ "9/(a) = diferenta a 2 multimi")
(print (dif_mult `(1 2 3 4) `(1 2 3)))
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
(terpri )

(defun lista_prim_aux(l)
    (cond
        ((atom l) nil)
        ((oddp (length l)) (cons (car l) (apply `append (mapcar `lista_prim_aux(cdr l)))))
        ;((oddp (length l)) (cons (car l) (mapcan `lista_prim_aux (cdr l))))
        (t (apply `append (mapcar `lista_prim_aux(cdr l))))))
        ;(t (mapcan `lista_prim_aux (cdr l)))))

(princ "9/(c) = primele elemente ale listelor de lungime impara")
(print (lista_prim_aux `(1 2 (3 (4 5) (6 7)) 8 (9 10 11))))
(print (lista_prim_aux `((1 (2 3) 4 5) (3 (4 5) (6 7)) 8 (9 10 11))))

(defun lista_prim(l)
    (cond
        ((atom l) nil)
        ((oddp (length l)) (cons (caar l) (lista_prim (cdr l))))
        (t (lista_prim (cdr l)))))
        
(print (lista_prim `((1 (2 3) 4 5) (3 (4 5) (6 7)) 8 (9 10 11))))
