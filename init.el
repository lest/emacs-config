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
                           "^\*rhtml-ruby-hook"))

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (remove-hook 'before-save-hook 'delete-trailing-whitespace)

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
(server-start)
