;;dot product of 2 vectors 
(defun dotP(a b)
    (cond
        ((or (null a) (null b)) 0)
        (t (+ (* (car a) (car b)) (dotP (cdr a) (cdr b))))))

(print (dotP '(1 2 3) '(4 5 6)))

;;adancimea unei liste 
(defun adanc(l)
    (cond
        ((null l) 0)
        ((listp (car l)) (+ (+ 1 (adanc (car l))) (adanc (cdr l))))
        (t (adanc (cdr l)))))

(print (adanc `(1 2 3 4 5)))
(print (adanc `(1 (2 (3)))))