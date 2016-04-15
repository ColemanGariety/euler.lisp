(defun special-pythagorean-triplet (n)
  (defun check (a b)
    (let ((c (sqrt (+ (expt a 2) (expt b 2)))))
      (cond ((= (+ a b c) n) (* a b (round c)))
            ((< b n) (check a (+ b 1)))
            (T (check (+ a 1) 1)))))
    (check 1 1))

(print (time (apply #'* (loop for i from 1 to 998 appending
                (loop for j from 1 to 999 appending
                     (loop for k from 1 to 1000 do
                          (when (and (< j k)
                                     (< i j)
                                     (eql 1000 (+ i j k))
                                     (eql (* k k) (+ (* j j) (* i i))))
                                 (return (list i j k)))))))))

(print (time (special-pythagorean-triplet 1000)))
