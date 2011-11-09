;; turn off toolbar and scrollbar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; directory with config
(setq config-dir (file-name-directory
                  (or (buffer-file-name) load-file-name)))

(defmacro load-config (filename)
  `(load (concat config-dir ,filename)))

(defmacro load-configs (&rest filenames)
  `(progn
     ,@(mapcar #'(lambda (f)
                   `(load-config ,f))
               filenames)))

(defmacro load-config-if-exists (filename)
  `(if (file-exists-p (concat config-dir ,filename))
       (load-config ,filename)))

;; environment settings
(load-config-if-exists "env.el")
(load-config-if-exists (concat system-name ".el"))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq yas/prompt-functions '(yas/dropdown-prompt yas/ido-prompt yas/no-prompt))

(setq el-get-sources
      '((:name yasnippet
               :type git
               :url "https://github.com/capitaomorte/yasnippet.git"
               :after (lambda ()
                        (require 'dropdown-list)
                        (setq yas/prompt-functions '(yas/dropdown-prompt
                                                     yas/ido-prompt
                                                     yas/no-prompt))))

        (:name coffee-mode
               :after (lambda ()
                        (add-hook 'coffee-mode-hook
                                  '(lambda () (set (make-local-variable 'tab-width) 2)))))

        (:name auto-complete
               :after (lambda ()
                        (add-to-list 'ac-modes 'erlang-mode)))

        haml-mode
        sass-mode

        (:name scss-mode
               :after (lambda ()
                        (setq scss-compile-at-save nil)
                        (add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))))

        (:name zencoding-mode
               :after (lambda ()
                        (add-hook 'rhtml-mode-hook 'zencoding-mode)))

        (:name css-mode
               :after (lambda ()
                        (setq css-indent-offset 2)))

        (:name nginx-mode
               :type git
               :url "https://github.com/ajc/nginx-mode.git")

        (:name slim-mode
               :type http
               :url "https://raw.github.com/stonean/slim/master/extra/slim-mode.el"
               :post-init (lambda ()
                            (autoload 'slim-mode "slim-mode" nil t)
                            (add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))))

        feature-mode
	haskell-mode
        magit
        markdown-mode
        rhtml-mode
        rspec-mode
        rvm
        rinari
        ruby-mode
        textile-mode
        yaml-mode))

(el-get 'sync (mapcar 'el-get-source-name el-get-sources))


;; vendor
(add-to-list 'load-path (concat config-dir "vendor"))

;; stop creating backup~ and #auto-save# files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; delete selection when typing
(delete-selection-mode t)

;; save last cursor position in file
(require 'saveplace)
(setq-default save-place t)

;; default input method
(setq default-input-method 'russian-computer)

;; don't use tabs for indent
(set-default 'indent-tabs-mode nil)

;; whitespace mode settings
(setq whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 120)

;; save history
(savehist-mode t)

;; encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

;; switch windows with C-left, C-right, C-up, C-down
(windmove-default-keybindings 'control)

;; yes and no
(fset 'yes-or-no-p 'y-or-n-p)

;; ido mode
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-ignore-buffers '("\\` "
                           "^\*Mess"
                           ".*Completion"
                           "^\*compilation"
                           "^\*rake"
                           "^\*generate"
                           "^\*magit"
                           "^\*slime-events\*"
                           "^\*rhtml-ruby-hook"))

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (remove-hook 'before-save-hook 'delete-trailing-whitespace)

;; make script files executable
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; require final newline
(setq require-final-newline t)

;; show empty lines
(setq-default indicate-empty-lines t)

;; uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; recent files
(require 'recentf)
(recentf-mode 1)

;; winner mode
(require 'winner)
(setq winner-dont-bind-my-keys t)
(global-set-key (kbd "<C-s-left>") 'winner-undo)
(global-set-key (kbd "<C-s-right>") 'winner-redo)
(winner-mode t)

;; gui options
(load-config "rc-gui.el")

;; custom functions
(load-config "rc-defuns.el")

;; custom hotkeys
(load-config "rc-hotkeys.el")

;; misc modes
(load-config "rc-misc.el")

;; programming languages
(load-configs "rc-ruby.el"
              "rc-erlang.el"
              "rc-js.el"
              "rc-haskell.el"
              "rc-lisp.el")

;; spell checking
(load-config "rc-spell.el")

;; org-mode
(load-config "rc-org.el")

;; start server
(require 'server)
(when (not (server-running-p))
  (server-start))
