;; nivelul unui nod
(defun get_left (tree)
    (cond
        ((null tree) nil)
        ((listp (cadr tree)) (cadr tree))
        (t nil)))

(defun get_right (tree)
    (get_left (cdr tree)))

(defun exists (tree nod)
    (cond
        ((null tree) nil)
        ((equal (car tree) nod) t)
        (t (or (exists (get_left tree) nod) (exists (get_right tree) nod)))))

(defun levels (tree nod)
    (cond
        ((equal (car tree) nod) 0)
        ((exists (get_right tree) nod) (+ 1 (levels (get_right tree) nod)))
        (t (+ 1 (levels (get_left tree) nod)))))

(print (levels `(5 (4 (4 (1)))) 1))

;; lista nodurilor de nivel maxim 
(defun noduri_nivel (tree level)
    (cond
        ((null tree) nil)
        ((eq level 0) (list (car tree)))
        ((> level 0) (append (noduri_nivel (get_left tree) (- level 1)) (noduri_nivel (get_right tree) (- level 1))))))

(defun numar_nivele (tree)
    (cond
        ((null tree) 0)
        (t (+ 1 (max (numar_nivele (get_left tree)) (numar_nivele (get_right tree)))))))

(defun numar_noduri (tree levels)
    (cond
        ((< 0 levels) (max (length (noduri_nivel tree levels)) (numar_noduri tree (- levels 1))))
        (t 0)))

(defun wrapper (tree lvl levels)
    (cond
        ((and (< 0 levels) (equal (length (noduri_nivel tree levels)) lvl)) (list (noduri_nivel tree levels) levels))
        (t (wrapper tree lvl (- levels 1)))))

(defun solve (tree)
    (wrapper tree (numar_noduri tree (numar_nivele tree)) (numar_nivele tree)))

(print (solve '(1 (2 (4) (5)) (3 (6)))))