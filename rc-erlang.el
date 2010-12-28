(add-to-list 'load-path (concat config-dir "vendor/erlang-mode"))
(require 'erlang-start)

(require 'erlang-flymake)
(erlang-flymake-only-on-save)

(add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
