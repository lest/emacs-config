;; js2
;; (add-to-list 'load-path (concat config-dir "vendor/js2-mode"))
;; (autoload 'js2-mode "js2-mode" nil t)

;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\.erb$" . js2-mode))

;; (setq js2-basic-offset 2)
;; (setq js2-use-ast-for-indentation-p t)

;; (eval-after-load 'js2-mode
;;   '(defun js2-before-save ()
;;      (whitespace-cleanup)))

(setq js-indent-level 2)
(setq js-auto-indent-flag nil)

;; json
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;; ejs
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))

;; jade
(autoload 'jade-mode "jade-mode" nil t)
