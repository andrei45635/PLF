;; sterge toate aparitiile unui numar dintr-o lista de la toate nivelurile 

(defun sterge (nr l)
    (cond
        ((and (atom l) (equal nr l)) nil)
        ((and (atom l) (not (equal nr l)))  (list l))
        ;;(t (apply `append (mapcar #'(lambda (x) (sterge nr x)) l)))))
        (t (mapcan #' (lambda (x) (sterge nr x)) l))))

(print (sterge 5 `(1 2 (5 (5 (5))) 4 (5 (5)) 5)))
(print (sterge 4 `(1 2 3 4 4 4 4 4 5)))
(print (sterge 3 `((1 (2 (3 (3 4 5 (3 (3)))) 3 4) 3 3) 3 (3 3))))

(defun stergere (nr l)
    (cond
        ((and (atom l) (equal nr l)) nil)
        ((and (atom l) (not (equal nr l))) l)
        (t (mapcar #'(lambda (x) (stergere nr x)) l))))

(print (stergere 5 `(1 2 (5 (5 (5))) 4 (5 (5)) 5)))
(print (stergere 4 `(1 2 3 4 4 4 4 4 5)))
(print (stergere 3 `((1 (2 (3 (3 4 5 (3 (3)))) 3 4) 3 3) 3 (3 3))))

(defun delete-number (l a)
    (cond
        ; if the current atom is a number and equal to the given number a, then don't add it to the result
        ((and (equal l a) (numberp l)) nil)
        ; if the current atom is a number but not equal to the given number a, then add it to the result
        ((and (not (equal l a)) (numberp l)) (list l))
        ; if the current atom is a list, apply the function delete-number to the list and add it to the result
        (t (list (mapcan #'(lambda(x) (delete-number x a)) l)))))

(print (delete-number `(1 2 (5 (5 (5))) 4 (5 (5)) 5) `5))
(print (delete-number `((1 (2 (3 (3 4 5 (3 (3)))) 3 4) 3 3) 3 (3 3)) `7))
(print (delete-number `(1 2 3 4 4 4 4 4 5) `4))
(print (delete-number `((1 (2 (3 (3 4 5 (3 (3)))) 3 4) 3 3) 3 (3 3)) `3))
