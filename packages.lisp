(in-package :cl-user)

(defpackage :google-scholar
  (:use :cl :drakma :cl-ppcre)
  (:export :citation :search-google-scholar))