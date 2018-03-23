(defsystem #:vgm
  :description "Handle .vgm files."
  :author "MegaLoler"
  :serial t
  :depends-on (#:cl-binary)
  :components
  ((:file "package")
   (:file "structs")
   (:file "read")))
