;; sterge toate aparitiile unui numar dintr-o lista de la toate nivelurile 

(defun sterge (nr l)
    (cond
        ((and (atom l) (equal nr l)) nil)
        ((and (atom l) (not (equal nr l)))  (list l))
        (t (apply `append (mapcar #'(lambda (x) (sterge nr x)) l)))))

(print (sterge 5 `(1 2 (5 (5 (5))) 4 (5 (5)) 5)))
(print (sterge 4 `(1 2 3 4 4 4 4 4 5)))
(print (sterge 3 `((1 (2 (3 (3 4 5 (3 (3)))) 3 4) 3 3) 3 (3 3))))