(setq load-path (cons "~/emacs/vendor/org-mode/lisp" load-path))
(setq load-path (cons "~/emacs/vendor/org-mode/contrib/lisp" load-path))
(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-special-ctrl-k t
      org-completion-use-ido t)

(require 'org-collector)
