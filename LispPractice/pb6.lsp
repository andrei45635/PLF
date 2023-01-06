;;nr de noduri dintr-un arbore (2)
(defun nrNoduri(l)
    (cond
        ((null (cdr l)) 1)
        (t (+ 1 (apply '+ (mapcar #'nrNoduri (cdr l)))))))

(print (nrNoduri '(a (b (c) (d (e))) (f (g)))))

;;adancime arbore (2)
(defun adancime(l)
    (cond
        ((null (cdr l)) 0)
        (t (+ 1 (apply 'max (mapcar #'adancime (cdr l)))))))

(print (adancime'(a (b (c) (d (e))) (f (g)))))

;;lista atomilor de adancime n in arbore (2)
(defun lista(l n)
    (cond
        ((and (= n 0) (atom l)) (list l))
        ((= n 0) nil)
        ((atom l) nil)
        (t (mapcan #'(lambda (l) (lista l (- n 1))) l))))

(print (lista '((a (b (c d))) e (f (g h (i)))) 3))

;;adancimea la care se afla un nod 
(defun adancimeNod(l n d)
    (cond
        ((null (cdr l)) d)
        ((not (equal (car l) n)) (mapcar #'(lambda (l) (adancimeNod l n (+ 1 d))) (cdr l)))
        (t (mapcar #' (lambda(l) (adancimeNod l n d)) (cdr l)))))

(print (adancimeNod '(a (b (c) (d (e))) (f (g))) `d 0))
(print (adancimeNod '(a (b (c) (d (e))) (f (g))) `e 0))

