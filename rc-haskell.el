(add-to-list 'load-path "~/emacs/haskell-mode")
(load "~/emacs/vendor/haskell-mode/haskell-site-file")

(defun lest/haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent)
  ;; (turn-on-haskell-indentation)
  (setq haskell-font-lock-symbols t))

(add-hook 'haskell-mode-hook 'lest/haskell-mode-hook)

(add-to-list 'exec-path "~/.cabal/bin")
