(add-to-list 'load-path (concat config-dir "vendor/haskell-mode"))
(load (concat config-dir "vendor/haskell-mode/haskell-site-file"))

(defun lest/haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent)
  ;; (turn-on-haskell-indentation)
  (setq haskell-font-lock-symbols t))

(add-hook 'haskell-mode-hook 'lest/haskell-mode-hook)

(add-to-list 'exec-path "~/.cabal/bin")
