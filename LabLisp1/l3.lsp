;; sterge toate aparitiile unui numar dintr-o lista de la toate nivelurile 

(defun sterge (nr l)
    (cond
        ((and (atom l) (equal nr l)) nil)
        ((and (atom l) (not (equal nr l)))  (list l))
        (t (apply `append (mapcar #'(lambda (x) (sterge nr x)) l)))))