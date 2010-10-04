(asdf:defsystem :google-scholar
  :serial t
  :version "1.0.0"
  :depends-on (:drakma :cl-ppcre :hunchentoot)
  :components ((:file "packages")
               (:file "google-scholar")))
