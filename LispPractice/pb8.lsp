;;cmmmc lista neliniara
(defun my_gcd (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil) 
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((= a b) a)
        ((= 0 a) b)
        ((= 0 b) a)
        ((> a b) (my_gcd (- a b) b))
        ((< a b) (my_gcd (- b a) a))))

(defun cmmmc(a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp b)) a)
        ((not (numberp a)) b)
        (t (/ (abs (* a b)) (my_gcd a b)))))

(defun cmmmcL(l)
    (cond
        ((and (null (cdr l)) (atom l)) (car l))
        ((listp (car l)) (cmmmc (cmmmcL (car l)) (cmmmcL (cdr l))))
        (t (cmmmc (car l) (cmmmcL (cdr l))))))

(print (cmmmcL '(24 ( 16 (12 A B)) 72)))
(print (cmmmcL `(1 2 4 (5 (6)))))

;;secventa munte
(defun munte(l k)
    (cond
        ((and (null (cdr l)) (= k 2)) t)
        ((and (< (car l) (cadr l)) (< k 2)) (munte (cdr l) 1))
        ((and (> (car l) (cadr l)) (> k 0)) (munte (cdr l) 2))
        (t nil)))

(print (munte `(10 18 29 17 11 10) 0))
(print (munte `(10 18 29 17 11 29 10) 0))

;;produsul atomilor pari de la nivel superficial 
(defun produs(l p)
    (cond
        ((null l) p)
        ((and (numberp (car l)) (evenp (car l))) (produs (cdr l) (* (car l) p)))
        (t (produs (cdr l) p))))

(print (produs `(1 2 4 (5 6) 3) 1))

;;elimina toate aparitiile elementului maxim
(defun maxInList(l m)
    (cond
        ((null l) m)
        ((listp (car l)) (max (maxInList (car l) m) (maxInList (cdr l) m)))
        ((< m (car l)) (maxInList (cdr l) (car l)))
        (t (maxInList (cdr l) m))))    

(print (maxInList `(1 2 4 5 2 2 1) 0))

(defun maxList (l)
    (maxInList l 0))

(defun stergeElem(l e)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (stergeElem (car l) e) (stergeElem (cdr l) e)))
        ((not (= (car l) e)) (cons (car l) (stergeElem (cdr l) e)))
        (t (stergeElem (cdr l) e))))

(print (stergeElem `(1 2 4 (5 (5 4 (5))) 3 4) 4))
(print (stergeElem `(1 2 4 5 4) 5))

(defun removeMax1(l)
    (stergeElem l (maxList l)))

(print (removeMax1 `(1 2 4 5 (5 (5 (5) 3)) 5 5 2 1)))