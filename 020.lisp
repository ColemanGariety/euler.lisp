;; (in-package :euler.lisp)

(defun factorial-digit-sum (n)
  (defun factorial (n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))))
  (defun sum-digits (n sum)
    (if (> n 1)
        (sum-digits (truncate (/ n 10)) (+ sum (mod n 10)))
        sum))
  (sum-digits (factorial n) 0))

(print (time (factorial-digit-sum 100)))
