(uiop:define-package #:timelib/test
    (:use :cl :timelib/all))

(in-package #:timelib/test)

(defun parse-test ()
  (let ((date (uiop:run-program "date --rfc-3339=seconds" :output :string)))
    (parse-time-string date "%F %T")))

(defun format-test (&optional (time (universal-to-unix-time (get-universal-time))))
  (format-time-string time))

(defun run-tests ()
  (string-equal (format-test) (format-test (parse-test))))
