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