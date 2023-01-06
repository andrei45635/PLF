;;reuniunea a doua multimi 
(defun check (l e)
    (cond
        ((null l) nil)
        ((listp (car l)) (check (car l) e))
        ((= (car l) e) t)
        (t (check (cdr l) e))))

(defun reuniune(a b)
    (cond
        ((null a) b)
        ((null b) a)
        ((check b (car a)) (reuniune (cdr a) b))
        (t (cons (car a) (reuniune (cdr a) b)))))

(print (reuniune `(2 4 1) `(2 3 5)))

;;produsul atomilor numerici de la orice nivel 
(defun productN (l)
    (cond
        ((numberp l) l)
        ((atom l) 1)
        (t (apply '* (mapcar #' productN l)))
    ))

(print (productN `(7 2 (3 (4 5) (6)))))

(defun produsNum(l p)
    (cond
        ((null l) (/ p 2))
        ((numberp (car l)) (produsNum (cdr l) (* p (car l))))
        ((listp (car l)) (* (produsNum (car l) p) p))
        (t (produsNum (cdr l) p))
    ))

(print (produsNum `(7 2 (3 (4 5) (6))) 1))

;;sortare cu pastrarea dublurilor
(defun ins(l e)
    (cond
        ((null l) (list e))
        ((< e (car l)) (cons e l))
        (t (cons (car l) (ins (cdr l) e)))))

(defun myOtherSort(l)
    (cond
        ((null l) nil)
        (t (ins (myOtherSort (cdr l)) (car l)))))

(print (myOtherSort '(1 3 2 5 6 7 7 3 9)))

;;lista cu pozitiile elementului minim din lista numerica
(defun minInList(l m)
    (cond
        ((null l) m)
        ((listp (car l)) (min (minInList (car l) m) (minInList (cdr l) m)))
        ((> m (car l)) (minInList (cdr l) (car l)))
        (t (minInList (cdr l) m))))    

(print (minInList `(1 2 4 5 2 2 1) 999))

(defun minList (l)
    (minInList l 999))

(defun findPos (l e pos)
    (cond
        ((null l) nil)
        ((= (car l) e) (cons pos (findPos (cdr l) e (+ 1 pos))))
        (t (findPos (cdr l) e (+ 1 pos)))))

(print (findPos `(1 2 4 5 6 1 1) 1 0))

(defun findMinPos (l pos)
    (findPos l (minList l) 0))

(print (findMinPos `(1 2 4 5 2 2 1 5 1 1 1 1 1) 0))