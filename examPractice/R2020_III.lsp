(defun sterg(l)
    (cond
        ((and (numberp l) (eq (mod l 3) 0)) nil)
        ((or (and (numberp l) (not (eq (mod l 3) 0))) (atom l)) (list l))
        (t (list (apply 'append (mapcar #' sterg l))))))

(print (sterg `(1 (2 a (3 a)) (6))))

(defun count-atoms(l)
    (cond
        ((numberp l) 0)
        ((atom l) 1)
        (t (apply '+ (mapcar #'count-atoms l)))))
    
(print (count-atoms `(a (b (c (1 2 (e)))))))

(defun solve(l lvl)
    (cond
        ((or (atom l) (numberp l)) 0)
        ((and (eq (mod lvl 2) 0) (eq (mod (count-atoms l) 2) 1)) (+ 1 (apply '+ (mapcar #'(lambda(x) (solve x lvl)) l))))
        (t (apply '+ (mapcar #'(lambda(x) (solve x (+ 1 lvl))) l)))
    ))

(print (solve `(a (b (c (1 2 (e))))) 1))

(defun subs(l lvl e)
    (cond
        ((and (atom l) (eq (mod lvl 2) 0)) e)
        ((and (atom l) (eq (mod lvl 2) 1)) l)
        (t (mapcar #' (lambda (x) (subs x (+ lvl 1) e)) l))))
        
(print (subs `(a (b (g)) (c (d (e)) (f))) 0 `h))