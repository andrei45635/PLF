;;produsul atomilor numerici de la nivel superficial 
(defun prod (l p)
    (cond
        ((null l) p)
        ((numberp (car l)) (prod (cdr l) (* (car l) p)))
        (t (prod (cdr l) p))))

(print (prod `(1 2 3 (4 5 6) (8 9)) 1))

;;multimea tuturor perechilor dintr-o lista 
(defun per(e l)
    (cond
        ((null l) nil)
        (t (cons (list e (car l)) (per e (cdr l))))))

(print (per 'f '(a b c d)))

(defun perechi (l)
    (cond
        ((null l) nil)
        (t (cons (per (car l) (cdr l)) (perechi (cdr l))))))

(print (perechi `(a b c d)))

;;expresie cu forma prefixata
(defun semn (sign a b)
    (cond
        ((string= sign "+") (+ a b))
        ((string= sign "-") (- a b))
        ((string= sign "*") (* a b))
        ((string= sign "/") (floor a b))
    ))

(defun expr (l)
    (cond
        ((null l) nil)
        ((and (and (numberp (cadr l)) (numberp (caddr l)))) (atom (car l)) (cons (semn (car l) (cadr l) (caddr l)) (expr (cdddr l))))
        (t (cons (car l) (expr (cdr l))))))

(defun solve (l)
    (cond
        ((null (cdr l)) (car l))
        (t (solve (expr l)))))

(print (solve `(+ * 2 4 - 5 * 2 2)))

;;numarul de aparitii unui element 
(defun apar(l e)
    (cond
        ((null l) 0)
        ((equal (car l) e) (+ 1 (apar (cdr l) e)))
        (t (apar (cdr l) e))))

(print (apar `(A B A B A C A) `A))

(defun deleteAtom(l e)
    (cond
        ((null l) nil)
        ((not(equal (car l) e)) (cons (car l) (deleteAtom (cdr l) e)))
        (t (deleteAtom (cdr l) e))))

(defun aparElem(l)
    (cond
        ((null l) nil)
        (t (cons (list (car l) (apar l (car l))) (aparElem (deleteAtom (cdr l) (car l)))))))

(print (aparElem `(A B A B A C A)))