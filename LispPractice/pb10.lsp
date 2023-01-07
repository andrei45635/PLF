;;cale de la radacina pana la nod dat 
(defun apare (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) t)
        (t (or (apare (cadr l) e) (apare (caddr l) e)))))

(defun cale (l n)
    (cond
        ((null l) nil)
        ((equal (car l) n) (list n))
        ((apare (cadr l) n) (cons (car l) (cale (cadr l) n)))
        (t (cons (car l) (cale (caddr l) n)))))

(print (cale `(a (b (c) (d (e))) (f (g))) `e))

;;arbore echilibrat 
(defun adancime(l)
    (cond
        ((null (cdr l)) 0)
        (t (+ 1 (apply 'max (mapcar #'adancime (cdr l)))))))

(print (adancime'(a (b (c) (d (e))) (f (g)))))

(defun echilibrat (l)
    (cond
        ((null l) 0)
        ((<(- (adancime (cadr l)) (adancime (caddr l))) 1) t)
        (t nil)))

(print (echilibrat `(a (b (c) (d (e))) (f (g)))))
(print (echilibrat '(a (b (c) (d (e))) (f (g) (h (i))))))