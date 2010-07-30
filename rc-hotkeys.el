;; mac hotkeys
(global-set-key (kbd "<s-left>") 'beginning-of-line)
(global-set-key (kbd "<s-right>") 'end-of-line)
(global-set-key (kbd "<s-up>") 'beginning-of-buffer)
(global-set-key (kbd "<s-down>") 'end-of-buffer)
(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-w") 'kill-this-buffer)
(global-set-key (kbd "<s-return>") 'open-next-line)
(global-set-key (kbd "<M-backspace>") 'my-backward-delete-word)

;; comment or uncomment region
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)

;; ido-imenu
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; buffer-menu
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; kill current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; open next line
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
  See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

(defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
  With argument, do this that many times.
  This command does not push erased text to kill-ring."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

;; delete word without putting it to kill-ring
(defun my-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
  With argument, do this that many times.
  This command does not pus erased text to kill-ring."
  (interactive "p")
  (my-delete-word (- arg)))
