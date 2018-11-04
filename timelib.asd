(asdf:defsystem :timelib
  :class :package-inferred-system
  :defsystem-depends-on ("asdf-package-system")
  :author       "Knut Olav Bøhmer <bohmer@gmail.com>"
  :license      "GNU GPL, version 3"
  :depends-on   ("cl-autowrap" "cl-plus-c" "timelib/all")
;;  :pathname     "src/"
  )


;; (register-system-packages "autowrap" '(:cl-autowrap))
;; (register-system-packages "plus-c" '(:cl-plus-c))
;; (register-system-packages "my-lib/test/all" '(:my-lib-test))

(register-system-packages "cl-autowrap/libffi" '(:autowrap))
(register-system-packages "cl-plus-c" '(:plus-c))
