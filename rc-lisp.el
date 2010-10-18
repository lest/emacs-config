(let ((file-name (expand-file-name "~/quicklisp/slime-helper.el")))
  (when (file-exists-p file-name)
    (load file-name)
    (require 'slime)))
