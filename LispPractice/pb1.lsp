;;insereaza elementul a dupa fiecare pozitie divizibila cu 2
(defun insr (l a pos)
    (cond
        ((null l) nil)
        ((= (mod pos 2) 0) (append (list (car l) a) (insr (cdr l) a (+ pos 1))))
        (t (cons (car l) (insr (cdr l) a (+ pos 1))))))

(print (insr `(1 3 5 6 7) 2 1))

;;inverseaza atomii de pe orice nivel
(defun invers(l col)
    (cond
        ((null l) col)
        ((atom (car l)) (invers (cdr l) (cons (car l) col)))
        ((listp (car l)) (append (invers (cdr l) col) (invers (car l) col)))
        (t (invers (cdr l) col))))

(defun inv (l)
    (invers l nil))

(print (inv `(((A B) C) (D E))))

;;cmmdc lista neliniara
(defun cmmdc (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil) 
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((= a b) a)
        ((= 0 a) b)
        ((= 0 b) a)
        ((> a b) (cmmdc (- a b) b))
        ((< a b) (cmmdc (- b a) a))))

(defun gcdL (l)
    (cond
        ((and (atom l) (null (cdr l))) (car l))
        ((listp (car l)) (cmmdc (gcdL (car l)) (gcdL (cdr l))))
        (t (cmmdc (car l) (gcdL (cdr l))))))

(print (gcdL'(24 ( 16 (12 A B)) 72)))

;;nr de aparitii ale unui atom 
(defun apar (l a)
    (cond
        ((null l) 0)
        ((and (atom (car l)) (equal (car l) a)) (+ 1 (apar (cdr l) a)))
        ((listp (car l)) (+ (apar (car l) a) (apar (cdr l) a)))
        (t (apar (cdr l) a))))

(print (apar '(1 (3 (5 4 3) (5 3)) 3 3) 3))