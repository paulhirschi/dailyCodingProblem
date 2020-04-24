(defvar the_list '(1 2 3 4 5))

(defun get_product_list_division (list)
    (let ((product) (product_list))
        (setf product (apply '* list))
        (dolist (x list)
            (let ((new_product))
                (setf new_product (/ product x))
                (setf product_list (append product_list (list new_product)))))
        product_list))

(defun get_product_list_rec (li pref acc)
    (cond
        ((null li) acc)
        (t (let ((suffix) (prefix) (prod) (accum))
            (setf prefix (append pref (list (first li))))
            (setf suffix (apply '* (rest li)))
            (setf prod (* suffix (apply '* (butlast prefix 1))))
            (setf accum (append acc (list prod)))
            (get_product_list_rec (rest li) prefix accum)))))

(defun get_product_list_iteration (list)
    ;; TODO)


(print (get_product_list_division the_list))
(print (get_product_list_rec the_list nil nil))

