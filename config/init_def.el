(provide 'init_def)

;; open current directory in IE
(defun browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))


;; delete word
(defun my-delete-word (arg)
  "Delete one word. This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (progn (backward-word arg) (point))
   (progn (forward-word arg)  (point))))

(global-set-key (kbd "M-d") 'my-delete-word)

;; delete line
(defun my-delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
	(end-of-line 1)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2))(delete-char 1))

(global-set-key (kbd "C-k") 'my-delete-line)
