(provide 'init_package)
;; =======================================
;;  WEB-MODE
;; =======================================
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

;; =======================================
;;  company
;; =======================================
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
;; =======================================
;;  js2-mode 
;; =======================================
(add-hook 'js-mode-hook 'js2-minor-mode)
;; =======================================
;;  company-tern 
;; =======================================
(add-to-list 'load-path "~/.emacs.d/library/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)

(require 'company-tern)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)

;; =======================================
;;  Haskell-mode 
;; =======================================
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(let ((my-cabal-path (expand-file-name "C:/Users/huang/AppData/Roaming/cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ";" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(setq haskell-ghci-program-args '("repl"))

(add-hook 'haskell-mode-hook #'hindent-mode)
;; =======================================
;;  ivy(swiper) 
;; =======================================
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x f") 'counsel-describe-function) 
(global-set-key (kbd "C-x v") 'counsel-describe-variable) 
;; =======================================
;;  highlight-symbol-colors 
;; =======================================
(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DeepPink1" "PeachPuff1" "SeaGreen2" "OrangeRed1")) 
(global-set-key (kbd "<f3>") 'highlight-symbol-at-point)
(global-set-key (kbd "<f4>") 'highlight-symbol-remove-all)
;; =======================================
;;  smooth-scrolling
;; =======================================
(require 'smooth-scrolling)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

;; =======================================
;;  python
;; =======================================
(elpy-enable)
(setq python-shell-completion-native-enable nil) 
(set-process-coding-system (get-buffer-process (elpy-rpc--get-rpc-buffer)) 'utf-8-dos 'utf-8-dos)
;;(elpy-use-ipython)
(defvar myPackages
  '(better-defaults
    elpy
    flycheck ;; add the flycheck package
    material-theme))

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq shell-mode-hook
      (function (lambda()
                  (set-buffer-process-coding-system 'utf-8 'utf-8)
				  (setq locale-coding-system 'utf-8)
				  (set-terminal-coding-system 'utf-8)
				  (set-language-environment 'UTF-8) ; prefer utf-8 for language settings
				  (set-default-coding-systems 'utf-8)
				  (setq default-buffer-file-coding-system 'utf-8)
				  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
				  (prefer-coding-system       'utf-8)
				  (setq buffer-file-coding-system 'utf-8)
				  (setq default-file-name-coding-system 'utf-8)
				  (setq default-keyboard-coding-system 'utf-8)
				  (setq default-process-coding-system '(utf-8 . utf-8))
				  (setq default-sendmail-coding-system 'utf-8)
				  (setq default-terminal-coding-system 'utf-8)

				  )))


;; =======================================
;;  others
;; =======================================
(require 'yasnippet)
(yas-global-mode 1)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'plsql)

(require 'hide-region)

(require 'vbnet-mode)
;; =======================================
;; Auto Complete
;; =======================================
;; (require 'auto-complete-config)
;; (ac-config-default)

;; =======================================
;; php-auto-yasnippets
;; need php-mode
;; =======================================
;;(require 'php-auto-yasnippets)
;;(setq php-auto-yasnippet-php-program "~/.emacs.d/elpa/php-auto-yasnippets-20141128.1411/Create-PHP-YASnippet.php")
;;(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
