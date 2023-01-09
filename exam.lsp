(defun suma_lista(l s)
    (cond
        ((null l) s)
        ((numberp (car l)) (suma_lista (cdr l) (+ s (car l))))
        ((listp (car l)) (+ (suma_lista (car l) 0) (suma_lista (cdr l) s)))
        (t (suma_lista (cdr l) s))))

(print (suma_lista `(1 2 3 (4) (5 (10 0)) 1) 0))

(defun sum_list(l)
    (suma_lista l 0))

(defun suma(l)
    (cond
        ((null l) nil)
        ((and (listp (car l)) (= (mod (sum_list (car l)) 2) 0)) (cons (suma (car l)) (suma (cdr l))))
        ((and (listp l) (= (mod (sum_list l) 2) 0)) (cons l (suma (cdr l))))
        ((atom (car l)) (suma (cdr l)))
        (t (cons (suma (car l)) (suma (cdr l))))))

(print (suma `(1 2 3 (4) (5 (10 0)) 1)))
(print (suma `(1)))
(print (suma `(1 (3))))
(print (suma `((2) (4 (6)))))

(defun my_sum (l)
    (cond
        ((null l) nil)
        ((= (mod (sum_list l) 2) 0) (list l))
        (t (list (apply 'append (mapcar #'my_sum l))))))

(print (my_sum `(1 2 3 (4) (5 (10 0)) 1)))
(print (my_sum `(1 (2) 3)))