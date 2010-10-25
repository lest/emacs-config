;; yasnippet
(require 'yasnippet-bundle)
(setq yas/prompt-functions '(yas/dropdown-prompt
			     yas/ido-prompt
			     yas/completing-prompt))

;; auto-complete
(add-to-list 'load-path (concat config-dir "vendor/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
(ac-config-default)

;; markdown-mode
(add-to-list 'load-path (concat config-dir "vendor/markdown-mode"))

;; haml-mode.el
(require 'haml-mode)

;; sass-mode.el
(require 'sass-mode)

;; yaml
(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; css
(setq css-indent-offset 2)

;; git
(add-to-list 'load-path (concat config-dir "vendor/magit"))
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-c g") 'magit-status)

;; zencoding
(add-to-list 'load-path (concat config-dir "vendor/zencoding"))
(require 'zencoding-mode)
(add-hook 'rhtml-mode-hook 'zencoding-mode)

;; nav
(add-to-list 'load-path (concat config-dir "vendor/nav"))
(autoload 'nav "nav" nil t)

;; nginx config files
(add-to-list 'load-path (concat config-dir "vendor/nginx-mode"))
(autoload 'nginx-mode "nginx-mode" nil t)
