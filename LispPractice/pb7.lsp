;;elementul de pe pozitia a n-a a unei liste liniare
(defun elemAt (l n pos)
    (cond
        ((null l) nil)
        ((= n pos) (car l))
        (t (elemAt (cdr l) n (+ 1 pos)))))

(print (elemAt `(1 2 10 4 5 6 7 8) 2 0))

;;succesorul unui numar reprezentat cifra cu cifra pe lista
(defun digit (n)
    (mod n 10))

(defun carry (n)
    (cond
        ((> (- n (mod n 10)) 9) (/ (- n (mod n 10)) 10))
        (T (- n (mod n 10)))))

(defun incNo (l)
    (cond
        ((null (cdr l)) (list (carry (+ 1 (car l))) (list (digit (+ 1 (car l))))))
        (T ((lambda (r) (list (carry (+ (car l) (car r))) (cons (digit (+ (car l) (car r))) (cadr r)))) (incNo (cdr l))))))

(defun succNo (l)
    ((lambda (r) 
         (cond
            ((= (car r) 1) (cons 1 (cadr r)))
            (T (cadr r)))) (incNo l)))

(print (succNo '(1 9 3 5 9 9)))
(print (succNo '(9 9)))

;;liniarizare 
(defun liniarizare(l)
    (cond
        ((numberp l) (list l))
        ((atom l) nil)
        (t (mapcan #' liniarizare l))))

(print (liniarizare `(1 (2 (1 3 (2 4) 3) 1) (1 4))))

;;suma la nivel superficial 
(defun supSuma(l s)
    (cond
        ((null l) s)
        ((atom (car l)) (supSuma (cdr l) (+ (car l) s)))
        (t (supSuma (cdr l) s))))

(print (supSuma `(1 2 3 (1 2 (3 4 (5)))) 0))