;;selecteaza al N-lea element al unei liste, nil daca nu exista 
(defun select(l n pos)
    (cond
        ((null (cdr l)) (car l))
        ((not(= pos n)) (select (cdr l) n (+ 1 pos)))
        ((= pos n) (car l))
        (t nil)))

(print (select `(1 4 5 1 2 4 5) 4 1))

;;verifica daca un atom e membru al unei liste nu neaparat liniara
(defun check (l e)
    (cond
        ((null l) nil)
        ((listp (car l)) (check (car l) e))
        ((= (car l) e) t)
        (t (check (cdr l) e))))

(print (check `(1 2 4 5 6) 4))
(print (check `(1 (2 3 (4 5 (6))) (7 8)) 5))

;;lista tuturor sublistelor unei liste
(defun subl (l res)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (cons (car l) (subl (car l) res)) (subl (cdr l) res)))
        (t (subl (cdr l) res))))

(print (subl `(1 2 (3 (4 5) (6 7)) 8 (9 10)) nil))

;;lista liniara -> multime 
(defun deleteAtom(l e)
    (cond
        ((null l) nil)
        ((not(= (car l) e)) (cons (car l) (deleteAtom (cdr l) e)))
        (t (deleteAtom (cdr l) e))))

(print (deleteAtom `(1 1 1 1 1 1 1 1 1 2 4 5 6) 1))

(defun transform (l)
    (cond
        ((null l) nil)
        (t (cons (car l) (transform (deleteAtom (cdr l) (car l)))))))

(print (transform '(1 2 3 44 2 4 5 2 3 3 3 3 4 4 5 77)))