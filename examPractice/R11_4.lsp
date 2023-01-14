(defun apartine (l e)
    (cond
        ((null l) nil)
        ((eq l e) t)
        (t (mapcar #' (lambda (x) (apartine x e)) l))))

(print (apartine `(a (b (g)) (c (d (e)) (f))) `e))

(defun cale(l v)
    (cond
        ((null l) nil)
        ((apartine l v) (list l))
        (t (mapcan #'(lambda (x) (cale x v)) l))))

(print (cale `(a (b (g)) (c (d (e)) (f))) `e))