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

;; find recent files
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

