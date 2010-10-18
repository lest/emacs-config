;; yasnippet
(require 'yasnippet-bundle)
(setq yas/prompt-functions '(yas/dropdown-prompt
			     yas/ido-prompt
			     yas/completing-prompt))

;; markdown-mode
(add-to-list 'load-path (concat config-dir "vendor/markdown-mode"))

;; haml-mode.el
(require 'haml-mode)

;; sass-mode.el
(require 'sass-mode)

;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; css
(setq css-indent-offset 2)

;; git
(add-to-list 'load-path (concat config-dir "vendor/magit"))
(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

;; zencoding
(add-to-list 'load-path (concat config-dir "vendor/zencoding"))
(require 'zencoding-mode)
(add-hook 'rhtml-mode-hook 'zencoding-mode)

;; nav
(add-to-list 'load-path (concat config-dir "vendor/nav"))
(autoload 'nav "nav" nil t)
