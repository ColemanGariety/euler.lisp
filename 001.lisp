(defun sum-of-multiples-of-three-or-five-below (n)
  (defun r (sum n)
       (if (> n 0)
           (r (if (or (zerop (mod n 3))
                         (zerop (mod n 5)))
                     (+ sum n)
                     sum)
              (- n 1))
           sum))
  (r 0 (- n 1)))

(print (sum-of-multiples-of-three-or-five-below 1000))

