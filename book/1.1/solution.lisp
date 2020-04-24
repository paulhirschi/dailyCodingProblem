(defvar the_list '(1 2 3 4 5)) ;; => (120 60 40 30 24)

;;; Get the product list using division
;;; Find product of entire list using a reducing scheme
;;; then divide by index value of list and append resulting value
(defun get_product_list_division (list)
    (let ((product) (product_list))
        ;; get product of entire list
        (setf product (apply '* list))
        (dolist (x list)
            (let ((new_product))
                ;; device product by index value
                (setf new_product (/ product x))
                ;; append resulting product to the final product_list
                (setf product_list (append product_list (list new_product)))))
        ;; return the product_list
        product_list))


;;; Shot at solving the problem using recursion.
;;; Initial function takes the list (li), prefix (pref), and accumulator (acc)
;;; If the list is empty, return the accumulator
;;; Each pass create a new prefix by appending the first item of the 
;;; list to pref. Reduce multiply the prefix and suffix, then multiply together.
;;; Append these values to accumulator
;;; Recurse by passing in (rest li) prefix accumu
;;; The initial call passes in the whole list, and nil for pref and acc
(defun get_product_list_rec (li pref acc)
    (cond
        ;; if li is empty, return acc
        ((null li) acc)
        ;; define new vars
        (t (let ((suffix) (prefix) (prod) (accum))
            ;; prefix is pre with first of li
            (setf prefix (append pref (list (first li))))
            ;; suffix is reduce of * of rest of li
            (setf suffix (apply '* (rest li)))
            ;; prod is * of suffix (tail end of list) with reduce of * over prefix butlast 1 (excluding current index)
            (setf prod (* suffix (apply '* (butlast prefix 1))))
            ;; append prod to acc for new accum
            (setf accum (append acc (list prod)))
            ;; make recursive call
            (get_product_list_rec (rest li) prefix accum)))))

;;; An iterative approach.
(defun get_product_list_iteration (list)
    ;; TODO)


(print (get_product_list_division the_list))
(print (get_product_list_rec the_list nil nil))

