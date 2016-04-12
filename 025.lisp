;; Problem 25
;;
;; First 12 items of fibonacci sequence are:
;;
;; 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144

;; first implementation.
;; sorta slow. (~1.42 secs)
;;
;; (defun n-digit-fibonacci (n)
;;   (defun fibonacci-step (state)
;;     (list (car (cdr state)) (reduce #'+ state)))
;;   (defun int->digits (n)
;;     (if (< -10 n 10) 1 (1+ (int->digits (truncate n 10)))))
;;   (defun count-digits (i state)
;;     (if (= (int->digits (car (cdr state))) n)
;;         i
;;         (count-digits (+ 2 i) (fibonacci-step state))))
;;   (count-digits 1 '(1 1)))

;; Second implementation
;; still slow! (~.04 secs)
;;
;; (defun n-digit-fibonacci (n)
;;   (defun fibonacci (n)
;;     (let ((a 0) (b 1)  ;;; the matrix to exponentiate
;;           (p 0) (q 1)) ;;; the seed vector to which to apply it
;;       (loop
;;          for c = (+ a b)
;;          until (zerop n)
;;          when (oddp n)
;;          do (psetq p (+ (* a p) (* b q))
;;                    q (+ (* b p) (* c q))) ;;; applying the current matrix
;;          do (psetq n (ash n -1) ;;; halving the exponent
;;                    a (+ (* a a) (* b b))
;;                    b (* b (+ a c))) ;;; squaring the current matrix
;;          finally (return p))))
;;   (defun test-index (i)
;;     (if (>= (fibonacci i) (expt 10 (1- n))) i (test-index (1+ i))))
;;   (test-index 0))

;; best yet!
;; ~0.009secs (~1 milliseconds)
(defun n-digit-fibonacci (n)
  (let ((cap (expt 10 (1- n))))
    (defun fibonacci (a b i)
    (if (< b cap)
        (fibonacci b (+ a b) (1+ i))
        i))
  (fibonacci 0 1 1)))

(print (time (n-digit-fibonacci 1000)))

;; (time (print (n-digit-fibonacci 1000)))

