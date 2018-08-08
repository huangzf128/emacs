(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
	(dumb-jump smooth-scrolling php-auto-yasnippets hindent highlight-symbol haskell-mode flycheck counsel company auto-complete js2-mode neotree elpy web-mode company-tern csv-mode iedit))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;-------------------------------
;; Environment
;;-------------------------------
(set-language-environment 'utf-8)

(when (string-equal system-type "windows-nt")
  (setenv "PATH"
		  (concat
		   "C:/Program Files/Git/usr/bin" ";"
		   (getenv "PATH")
		   )))
;;-------------------------------
;; path
;;-------------------------------
(add-to-list 'load-path "~/.emacs.d/library/")
(add-to-list 'load-path "~/.emacs.d/config/")

;;-------------------------------
;; package
;;-------------------------------
(require 'package)
;; MELPA
 (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(require 'init_com)
(require 'init_def)
;; install package in package-selected-packages
;; (package-refresh-contents)
;; (package-install-selected-packages)

(require 'init_package)
;; ------------  Temp ------------------

;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (setq buffer-file-coding-system 'utf-8)
;; (setq default-file-name-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (set-default-coding-systems 'Japanese)
;; (set-terminal-coding-system 'utf-8)

;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;; (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;; (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;; (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;; (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;; (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;; (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
