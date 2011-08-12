(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("/\\.\\(irb\\|cap\\)rc$" . ruby-mode))

;; flymake
(eval-after-load 'ruby-mode
  '(progn
     (require 'flymake)
     ;; Invoke ruby with '-c' to get syntax checking
     (defun flymake-ruby-init ()
       (let* ((temp-file (flymake-init-create-temp-buffer-copy
                          'flymake-create-temp-inplace))
              (local-file (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
         (list "ruby" (list "-c" local-file))))
     (push '("\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("\\.rake$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("\\.gemspec$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("\\.ru$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("Gemfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("Capfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
     (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
           flymake-err-line-patterns)
     (add-hook 'ruby-mode-hook
               (lambda ()
                 (when (and buffer-file-name
                            (file-writable-p
                             (file-name-directory buffer-file-name))
                            (file-writable-p buffer-file-name)
                            (if (fboundp 'tramp-list-remote-buffers)
                                (not (subsetp
                                      (list (current-buffer))
                                      (tramp-list-remote-buffers)))
                              t))
                   (local-set-key (kbd "C-c d")
                                  'flymake-display-err-menu-for-current-line)
                   (flymake-mode t))))))

;; rinary
(add-to-list 'load-path (concat config-dir "vendor/rinari"))
(require 'rinari)

;; yasnippets-rails
(load (concat config-dir "vendor/yasnippets-rails/setup.el"))

;; rspec
(add-to-list 'load-path (concat config-dir "vendor/rspec-mode"))
(require 'rspec-mode)

;; cucumber
(add-to-list 'load-path (concat config-dir "vendor/cucumber.el"))
(require 'feature-mode)

;; rhtml
(add-to-list 'load-path (concat config-dir "vendor/rhtml"))
(autoload 'rhtml-mode "rhtml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . rhtml-mode))

;; rvm
(add-to-list 'load-path (concat config-dir "vendor/rvm.el"))
(require 'rvm)
(rvm-autodetect-ruby)
