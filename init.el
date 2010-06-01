;; environment settings
(load "~/emacs/env.el")

;; vendor
(add-to-list 'load-path "~/emacs/vendor")

;; stop creating backup~ and #auto-save# files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; delete selection when typing
(delete-selection-mode t)

;; save last cursor position in file
(require 'saveplace)
(setq-default save-place t)

;; default input method
(setq default-input-method 'russian-typewriter)

;; save history
(savehist-mode t)

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
			   "^\*magit"))

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; require final newline
(setq require-final-newline t)

;; uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; gui options
(load "~/emacs/rc-gui.el")

;; custom functions
(load "~/emacs/rc-defuns.el")

;; custom hotkeys
(load "~/emacs/rc-hotkeys.el")

;; misc modes
(load "~/emacs/rc-misc.el")

;; programming languages
(load "~/emacs/rc-ruby.el")
(load "~/emacs/rc-erlang.el")

;; spell checking
(load "~/emacs/rc-spell.el")

;; start server
(server-start)
