(add-to-list 'load-path (concat config-dir "vendor/haskell-mode"))
(load (concat config-dir "vendor/haskell-mode/haskell-site-file"))

(defun my-haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent))

(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)

(add-to-list 'exec-path "~/.cabal/bin")
