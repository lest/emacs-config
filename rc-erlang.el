;; erlang-mode
(add-to-list 'load-path (concat config-dir "vendor/erlang-mode"))
(require 'erlang-start)

(require 'flymake)

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
         (local-file (file-relative-name temp-file
                                         (file-name-directory buffer-file-name))))
    (list (concat config-dir "bin/eflymake") (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
	     '("\\.erl\\'" flymake-erlang-init))

(defun my-erlang-mode-hook ()
  (flymake-mode 1))
(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
