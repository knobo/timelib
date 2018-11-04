(uiop:define-package #:timelib/all
  (:use :cl)
  (:mix :autowrap :plus-c :timelib/ffi)
  (:nicknames :timelib :tl)
  (:shadow #:time)
  (:export #:format-time-string
           #:parse-time-string
           #:universal-to-unix-time
           #:unix-to-universal-time))

(in-package :timelib/all)

(defvar *unix-epoch-difference*
  (encode-universal-time 0 0 0 1 1 1970 0))

(defun universal-to-unix-time (universal-time)
  (- universal-time *unix-epoch-difference*))

(defun unix-to-universal-time (unix-time)
  (+ unix-time *unix-epoch-difference*))

(defun parse-time-string (str &optional (format "%Y-%m-%dT%H:%M:%S%z"))
  (c-with ((tm (:struct (tm))))
    (strptime str format tm)
    (mktime tm)))

(defun format-time-string (unix-time &optional (format "%F %T") (max-length 40))
  (c-with ((time time-t))
    (setf time unix-time)
    (cffi:with-foreign-string (s (make-string max-length))
      (strftime s max-length format (gmtime (time &)))
      (cffi:foreign-string-to-lisp s))))


;; (c-with ((m time-t))
;;   (setf m (local-time:timestamp-to-unix (local-time:now)))
;;   (cffi:with-foreign-string (str (make-string 50))
;;     (strftime str 20  "%F %T" (gmtime (m &)))
;;     (cffi:foreign-string-to-lisp str)))


;;(cffi:foreign-string-to-lisp s)
