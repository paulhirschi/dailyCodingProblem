(defvar *the_list* '(1 2 3 4 5))
(defvar *answer* '(120 60 40 30 24))

;;; Get the product list using division
;;; Find product of entire list using a reducing scheme
;;; Map through the list, divide product by element at index
(defun get_product_list_division (list)
    (let ((product))
        ;; get product of entire list
        (setq product (apply '* list))
        (mapcar #'(lambda (x) (/ product x)) list)))


;;; Tail recursive function that multiplies suffix elements (li) and
;;; prefix elements (pref) and keeps track with accumulator (acc)
(defun get_product_list_rec (li pref acc)
    (cond
        ((null li) acc)
        (t (let ((suffix) (prefix) (prod) (accum))
            (setq
                ;; prefix is pre with first of li
                prefix (append pref (list (first li)))
                ;; suffix is reduce of * over rest of li
                suffix (apply '* (rest li))
                ;; prod is * of suffix (tail end of list) with reduce of * over prefix butlast 1 (excluding current index)
                prod (* suffix (apply '* (butlast prefix 1)))
                ;; append prod to acc for new accum
                accum (append acc (list prod)))
            ;; make recursive call
            (get_product_list_rec (rest li) prefix accum)))))


(print (get_product_list_division *the_list*) )
(print (get_product_list_rec *the_list* nil nil) )

