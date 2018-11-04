(uiop:define-package :timelib/ffi
  (:use :cl :autowrap)
  (:shadow #:time)
  (:export #:mk-time))

(in-package :timelib/ffi)

(autowrap:c-include (merge-pathnames "spec/mytime.h" (asdf:system-source-directory :timelib))
           :spec-path (merge-pathnames "spec/" (asdf:system-source-directory :timelib))
           :sysincludes '("/usr/include/x86_64-linux-gnu"))
