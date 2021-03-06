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
  (setq web-mode-html-offset    4)
  (setq web-mode-css-offset     4)
  (setq web-mode-script-offset  4)
  (setq web-mode-php-offset     4)
  (setq web-mode-java-offset    4)
  (setq web-mode-script-padding 0)
       (company-mode 1)
       (auto-complete-mode -1)
       (tern-mode t)
  (setq tab-width 4))
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
;;(global-set-key (kbd "C-s") 'swiper)

(global-set-key (kbd "C-s") (lambda () (interactive) (swiper (get-current-word(interactive)))))

(global-set-key (kbd "C-x f") 'counsel-describe-function)
(global-set-key (kbd "C-x v") 'counsel-describe-variable)
;; =======================================
;;  highlight-symbol-colors
;; =======================================
(require 'highlight-symbol)
(setq highlight-symbol-colors '("DarkOrange" "DeepPink1" "PeachPuff1" "SeaGreen2" "OrangeRed1"))
(global-set-key (kbd "<f4>") 'highlight-symbol-at-point)
(global-set-key (kbd "S-<f4>") 'highlight-symbol-remove-all)
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
(setq elpy-shell-echo-input nil)
;; (defun python-shell-parse-command ()
;;   "Return the string used to execute the inferior Python process."
;;   "python3 -i")

(setq elpy-rpc-python-command "python")
(setq elpy-shell-use-project-root nil) ; to start the shell in the directory of the Python file
;;(setq flycheck-highlighting-mode 'lines)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;;(elpy-use-ipython)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-hook 'elpy-mode-hook
			'(lambda ()
			   ;;(set-language-environment 'Japanese)
			   (setenv "PYTHONIOENCODING" "utf-8")
			   )))

(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "<f3>") 'elpy-goto-definition)
             (local-set-key (kbd "S-<f3>") 'xref-pop-marker-stack)
			 ))

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
