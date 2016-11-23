(provide 'init_package)

;; ========================
;; WEB-MODE
;; ========================
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;;	(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; indent
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset     2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset   2)
  (setq web-mode-java-offset   2)
       (company-mode 1)
       (auto-complete-mode -1)
       (tern-mode t)
  (setq tab-width 2))
(add-hook 'web-mode-hook 'web-mode-hook)

;; ========================
;; php-auto-yasnippets
;; need php-mode
;; ========================
;;(require 'php-auto-yasnippets)
;;(setq php-auto-yasnippet-php-program "~/.emacs.d/elpa/php-auto-yasnippets-20141128.1411/Create-PHP-YASnippet.php")
;;(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

;; ========================
;; Auto Complete
;; ========================
;; ~~~~~~~~~~~~~~~~~~~ auto-complete ~~~~~
;; (require 'auto-complete-config)
;; (ac-config-default)
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; ========================
;; company
;; ========================
(require 'company)
(global-company-mode) ; 
(setq company-idle-delay 0) ;default:0.5
(setq company-minimum-prefix-length 2) ; default:4
(setq company-selection-wrap-around t) 
(setq company-dabbrev-downcase nil)

(defun js-mode-hook ()
  "Hooks for Javascript mode."
       (company-mode 1)
       (auto-complete-mode -1))
(add-hook 'js-mode-hook 'js-mode-hook)

;; ~~~~~~~~~~~~~~~~~~~ js2-mode ~~~~~~~~~~~
;;(require 'js2-mode)
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; ~~~~~~~~~~~~~ company-tern ~~~~~~~~~~~~~~~~
(add-to-list 'load-path "~/.emacs.d/library/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)

(require 'company-tern)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(require 'yasnippet)
(yas-global-mode 1)

;; ~~~~~~~~~~~~ ivy(swiper) ~~~~~~~~~~~~~~~~~
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x f") 'counsel-describe-function) 
(global-set-key (kbd "C-x v") 'counsel-describe-variable) 
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(require 'plsql)

(require 'hide-region)

;; ~~~~~~~~~~~~ highlight-symbol-colors ~~~~~~~~~~~~~~~~~
(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DeepPink1" "PeachPuff1" "SeaGreen2" "OrangeRed1")) 
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f4>") 'highlight-symbol-remove-all)
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
