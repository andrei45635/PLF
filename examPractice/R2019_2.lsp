(defun my_rev (l col)
    (cond
        ((null l) col)
        ((listp (car l)) (my_rev (cdr l) (cons (my_rev (car l) nil) col)))
        (t (my_rev (cdr l) (cons (car l) col)))
    ))

(print (my_rev `(a (b 2) (1 c 4) (d 1 (6 f)) ((g 4) 6) f) nil)) 

(defun rev(l)
    (my_rev l nil))
    
(print (rev `(a (b 2) (1 c 4) (d 1 (6 f)) ((g 4) 6) f)))

(defun liniar(l)
    (cond
        ((numberp l) nil)
        ((atom l) (list l))
        (t (mapcan #'liniar l))))
    
(print (liniar `(a (b 2) (1 c 4) (d 1 (6 f)) ((g 4) 6) f))) 

(defun verif(l)
    (atom (car (liniar l))))
    
(print (verif (rev `(a (b 2) (1 c 4) (d 1 (6 f)) ((g 4) 6) f))))

(defun main(l)
    (apply '+ (mapcar #'aux (rev l))))

(defun aux(l)
    (cond
        ((or (null l) (atom l)) 0)
        ((and (not (numberp (car l))) (atom (car l))) (+ 1 (apply '+ (mapcar #'aux l))))
        ((and (listp (car l)) (>= (apply '+ (mapcar #'aux (list(car l)))) 1)) (+ 1 (apply '+ (mapcar #'aux l))))
        (t (apply '+ (mapcar #'aux l)))))
    
(print (main `(a (b 2) (1 c 4) (d 1 (6 f)) ((g 4) 6) f))) 

(defun max-elem(l k)
    (cond
        ((null l) k)
        ((and (numberp (car l)) (>= k (car l))) (max-elem (cdr l) k))
        ((atom (car l)) (max-elem (cdr l) (car l)))
        (t (max-elem (cdr l) (car l)))
    ))

(defun maxE(l)
    (cond
        ((null l) nil)
        ((max-elem (cdr l) (car l)))
    ))

(print (maxE `(a 2 5 3 c))) 

(defun solve(l lvl)
    (cond
        ((atom l) 0)
        ((numberp l) 0)
        ((and (eq (mod (maxE l) 2) 0) (eq (mod lvl 2) 1)) (+ 1 (apply '+ (mapcar #'(lambda(x) (solve x lvl)) l))))
        (t (apply '+ (mapcar #'(lambda(x) (solve x (+ 1 lvl))) l)))))
        
(defun subs(l lvl k)
    (cond
        ((and (atom l) (eq lvl k)) 0)
        ((and (atom l) (not (eq lvl k))) l)
        (t (mapcar #' (lambda (x) (subs x (+ lvl 1) k)) l))))
        
(print (subs `(a (1 (2 b)) (c (d))) 0 2))