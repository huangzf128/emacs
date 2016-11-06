(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(package-selected-packages
   (quote
    (csv-mode counsel swiper company-tern js2-mode company php-auto-yasnippets web-mode auto-complete))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-to-list 'load-path "~/.emacs.d/library/")
(add-to-list 'load-path "~/.emacs.d/config/")

;;-------------------------------
;; package
;;-------------------------------
(require 'package)

;; MELPA
 (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Marmalade
;;(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(require 'init_com)
(require 'init_def)
;; (package-refresh-contents)
;; (package-install-selected-packages) ;; install package in package-selected-packages
(require 'init_package)
