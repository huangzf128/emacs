(provide 'init_com)

(setq auto-save-default nil)
(setq create-lockfiles nil)   ;;not create lock file like ".#file..."
(setq backup-directory-alist `((".*" . "~/.emacs.d/backup")))
(setq default-major-mode 'text-mode)
(put 'narrow-to-region 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p) ;; replace yes with y

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode +1) ;;delete selection on insert
(setq kill-whole-line t)   ;;delete include \r\n

(set-default 'truncate-lines t) ;; display in one line
;;(global-hl-line-mode t) ;; current line with color
(electric-pair-mode t) ;; auto ( )

(setf org-src-fontify-natively t) ;; the same color with the code mode 

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(setq default-tab-width 4) 

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; 	key bind
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;open emacs home 
(defun open-my-init-file() (interactive) (find-file "~/.emacs.d/"))
(global-set-key (kbd "<f7>") 'open-my-init-file)
(defun open-my-memo() (interactive) (find-file "~/.emacs.d/memo/"))
(global-set-key (kbd "<f8>") 'open-my-memo)

;; move window
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; theme, layout
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(setq-default cursor-type 'bar)
(setq ring-bell-function 'ignore) ;; close system alert

;; Japanese Font
;(set-face-attribute 'default nil :family "Hoge" :height 140)
;;font size
;;(set-face-attribute 'default nil :height 120)

;; theme
(require 'custom-file)

(defun set-font (english chinese english-size chinese-size)
;; Setting English Font
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(when (equal window-system 'w32)
			 (set-font   "Consolas" "Microsoft Yahei"   18 20)
  )

;; (defun suzuki-mac-input-method-decorate (roman-source japanese-source)
;;   (mac-set-input-method-parameter japanese-source 'title "あ")
;;   (mac-set-input-method-parameter japanese-source 'cursor-color "red")
;;   (mac-set-input-method-parameter roman-source 'cursor-color "blue"))

;; (when (boundp 'mac-input-method-parameters)
;;   (setq default-input-method "MacOSX")
;;   (cond
;;    ;; ことえり
;;    ((string-match "com.apple.inputmethod.Kotoeri" (mac-get-current-input-source))
;;     (suzuki-mac-input-method-decorate
;;      "com.apple.inputmethod.Kotoeri.Roman"
;;      "com.apple.inputmethod.Kotoeri.Japanese"))
;;    ;; Google 日本語入力
;;    ((string-match "com.google.inputmethod.Japanese" (mac-get-current-input-source))
;;     (suzuki-mac-input-method-decorate
;;      "com.google.inputmethod.Japanese.Roman"
;;      "com.google.inputmethod.Japanese.base"))))


