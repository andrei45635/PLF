;;dubleaza elementul de pe pozitia n
(defun insN (l n pos)
    (cond
        ((null l) nil)
        ((= n pos) (cons (car l) (insN (cdr l) n (+ 1 pos))))
        (t (cons (car l) (insN (cdr l) n (+ 1 pos))))))

(print (insN `(10 20 30 30 40 50) 3 1))

;;asociere fiecare element cu fiecare element 
(defun asociere (a b)
    (maplist #'(lambda (x y) (cons (car x) (car y))) a b))

(print (asociere `(A B C) `(X Y Z)))

;;numarul tuturor sublistelor 
(defun nrSub (l)
    (cond
        ((null l) 1)
        ((listp (car l)) (+ (nrSub (car l)) (nrSub (cdr l))))
        (t (nrSub (cdr l))))) 

(print (nrSub `(1 2 (3 (4 5) (6 7)) 8 (9 10))))

;;nr atomilor de la nivel superficial
(defun nrAtom (l k)
    (cond
        ((null l) k)
        ((atom (car l)) (nrAtom (cdr l) (+ 1 k)))
        (t (nrAtom (cdr l) k))))

(print (nrAtom `(1 2 (3 (4 5) (6 7)) 8 (9 10)) 0))