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
  "Delete current line char.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
	(end-of-line 1)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2))(delete-char 1))

(global-set-key (kbd "C-k") 'my-delete-line)

;; copy word
(defun my-copy-word (arg)
  "copy one word. if no region, copy the word around pointer"
  (interactive "p")
  (let (bounds pos1 pos2 mything)
	(if (use-region-p)
		(setq pos1 (region-beginning) pos2 (region-end))
	  (progn
		(setq bounds (bounds-of-thing-at-point 'symbol))
		(setq pos1 (car bounds))
		(setq pos2 (cdr bounds))))
	(if (and (not (equal pos1 nil)) (not (equal pos2 nil)))
		(copy-region-as-kill pos1 pos2))))
(global-set-key (kbd "M-w") 'my-copy-word)

;; hide region
(defun hide-show-region ()
  (interactive)
  (if (use-region-p)
	  (hide-region-hide())
	  (hide-region-unhide-below(point))
	  ))
(global-set-key (kbd "<f2>") 'hide-show-region)
