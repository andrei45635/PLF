(defun suma (l)
    (cond
        ((atom (car l)) 0)
        ((numberp (car l)) (+ (car l) (suma (cdr l))))
        ((listp (car l)) (+ (suma (car l)) (suma (cdr l))))
        (t (suma (cdr l)))))
    
    
(defun nrS (l lvl)
    (cond
        ((null l) 0)
        ((and (eq (mod (suma l) 2) 0) (eq (mod lvl 2) 1)) (+ 1 (apply '+ (mapcar #'(lambda (x) (suma x (+ 1 lvl)))))))
        (t (apply '+ (mapcar #' (lambda (x) (suma x (+ 1 lvl))))))))
        
(print (suma `(a 1 (b 2))))