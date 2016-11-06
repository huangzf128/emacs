(provide 'custom-file)

(defface font-lock-todo-face nil
  "Font Lock mode face used to highlight TODO."
  :group 'font-lock-faces)
(defface font-lock-done-face nil
  "Font Lock mode face used to highlight DONE."
  :group 'font-lock-faces)
(dolist (mode '(c-mode c++-mode java-mode lisp-mode emacs-lisp-mode erlang-mode
                       go-mode
                       actionscript-mode lisp-interaction-mode sh-mode sgml-mode))
  (font-lock-add-keywords
   mode
   '(("\\<\\(FIXME\\|TODO\\|Todo\\|HACK\\|todo\\):" 1  'font-lock-todo-face prepend)
     ("@\\<\\(FIXME\\|TODO\\|Todo\\|HACK\\|todo\\)" 1  'font-lock-todo-face prepend)
     ("\\<\\(DONE\\|Done\\|done\\):" 1 'font-lock-done-face t)
     ("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)
     )))

;; show some functions as keywords
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("\\<\\(quote\\|add-hook\\|equal\\)" .
                           font-lock-keyword-face)))
;; recognize some things as functions
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("\\<\\(autoload\\|setq-default\\|\\|setq-local\\|setq\\|add-hook\\|define-key-lazy\\|define-key\\|global-set-key\\)\\>" .
                           font-lock-function-name-face)))
;; recognize some things as constants
(font-lock-add-keywords 'emacs-lisp-mode
                        '(("\\<\\(nil\\|\\t\\)\\_>" .
                           font-lock-constant-face)))
;;; faces
;;(set-background-color "#2e2d28")
;;(set-foreground-color "#a1aca7") "#f7f8c6"
;;(set-default-font "DejaVu Sans Mono:pixelsize=16")
;;几种不错的颜色 263111棕色 354022浅棕色 ;;48433d  41412e
;; (set-background-color "#263111")
;; (set-background-color "#2e2d28")
 (set-background-color "#000000")

;; (set-mouse-color "GreenYellow")
 (set-foreground-color "#f7f8c6")
;; (require 'server)

;; 如果配置好了， 下面20个汉字与40个英文字母应该等长
;; here are 20 hanzi and 40 english chars, see if they are the same width
;;
;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa|
;; 你你你你你你你你你你你你你你你你你你你你|
;; あいうえおかきくけこさしすせそたちつてと|
;; ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|
;; 。。。。。。。。。。。。。。。。。。。。|
;; 1111111111111111111111111111111111111111|
;; 東東東東東東東東東東東東東東東東東東東東|

;; ここここここここここここここここここここ|
;; ｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺ|
;; 까까까까까까까까까까까까까까까까까까까까|

(defun create-frame-font-mac()          ;emacs 若直接启动 启动时调用此函数似乎无效
  (set-face-attribute
   'default nil :font "Menlo 12")
  ;; Chinese Font
  (dolist (charset '( han symbol cjk-misc bopomofo)) ;script 可以通过C-uC-x=查看当前光标下的字的信息
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "PingFang SC" :size 14)))

  (set-fontset-font (frame-parameter nil 'font)
                    'kana                 ;script ｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺｺ
                    (font-spec :family "Hiragino Sans" :size 14))
  (set-fontset-font (frame-parameter nil 'font)
                    'hangul               ;script 까까까까까까까까까까까까까까까까까까까까
                    (font-spec :family "Apple SD Gothic Neo" :size 16))
  )

(when (and (equal system-type 'darwin) (window-system))
  (add-hook 'after-init-hook 'create-frame-font-mac)	;; font for mac
  (add-hook 'after-init-hook 'emacs-daemon-after-make-frame-hook)  ;; window layout for mac
  )
;; (create-frame-font-mac)
;; (create-fontset-from-fontset-spec
;;    "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-fontset-mymac,
;;  ascii:-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
;; han:-*-PingFang SC-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1,
;; cjk-misc:-*-PingFang SC-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1,
;; Kana:-*-PingFang SC-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")

;; (add-to-list 'default-frame-alist '(font . "fontset-mymac"))
;; (set-frame-font "fontset-mymac" )


(defun  emacs-daemon-after-make-frame-hook(&optional f) ;emacsclient 打开的窗口相关的设置
  
  (set-frame-parameter f 'alpha 85)
  (set-frame-size f 110 60)
  (set-frame-position f 250 25)
 ;; (with-selected-frame f    	
  )

;; (frame-parameters)

;(add-hook 'before-make-frame-hook 'emacs-daemon-after-make-frame-hook)
;(add-hook 'after-make-frame-functions 'emacs-daemon-after-make-frame-hook)


 ;;(emacs-daemon-after-make-frame-hook)

;; (defadvice text-scale-adjust (around allow_adjust_cjk_font_size activate)
;;   "在mac 窗口模式下，允许字体大小可变，因默认的等宽字体大小是固定的，不允许调大小"
;;   (when (and (equal system-type 'darwin) (window-system))
;;     (create-fontset-from-fontset-spec
;;      "-apple-Menlo-medium-normal-normal-*-*-*-*-*-m-0-fontset-mymac,
;;  ascii:-apple-Menlo-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1,
;; han:-*-PingFang SC-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1,
;; cjk-misc:-*-PingFang SC-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1,
;; Kana:-*-PingFang SC-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"))
;;   ad-do-it)

;;     (create-fontset-from-fontset-spec
;;      "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-fontset-mymac,
;;  ascii:-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
;; han:-*-Arial Unicode MS-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1,
;; cjk-misc:-*-Arial Unicode MS-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1,
;; kana:-*-Arial Unicode MS-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")
;;     (create-fontset-from-fontset-spec
;;      "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-fontset-mymac,
;;  ascii:-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
;; han:-*-STFangsong-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1,
;; cjk-misc:-*-STFangsong-normal-normal-normal-*-12-*-*-*-p-0-iso10646-1,
;; kana:-*-STFangsong-normal-normal-normal-*-12-*-*-*-p-0-iso10646-1")
;;     (create-fontset-from-fontset-spec
;;      "-apple-Menlo-medium-normal-normal-*-13-*-*-*-m-0-fontset-mymac,
;;  ascii:-apple-Menlo-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1,
;; han:-*-STSong-normal-normal-normal-*-16-*-*-*-p-0-iso10646-1,
;; cjk-misc:-*-STSong-normal-normal-normal-*-16-*-*-*-p-0-iso10646-1,
;; kana:-*-STFangsong-normal-normal-normal-*-16-*-*-*-p-0-iso10646-1")



(setq-default window-system-default-frame-alist ;直接emacs命令打开的窗口相关设置,不要在这里设置字体，否则daemon 启动时字体有可能没创建好，会导致字体设置失败
              '( (x ;; if frame created on x display
                  (alpha . 93)
                  (cursor-color . "green")
                  )
                 (ns ;; if frame created on mac
                  ;; (border-color . "black")
                  ;; (cursor-color . "green")
                  (alpha . 85)
                  (height . 50)
                  (width . 140)
                  (left . 160)
                  (top . 80)
                  (foreground-color . "#eeeeec")
                   (background-color . "#202020") ;;
                  ;;  ;; (background-color . "#263111")
                  ;;  (cursor-color . "green")
                  ;;  (mouse-color ."gold")
                  ;;  (mouse-color . "Gainsboro")
                  ;;         (font . "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
                  ;; (font . "fontset-mymac")
                  ;;(font . "Menlo-14")
                  )
                 (w32
                  ;; (font . "fontset-w32")
                  ;; (background-color . "#0C1021")
                  ;; (background-mode . dark)
                  ;; (border-color . "black")
                  (alpha . 95)
                  ;; (cursor-color . "#A7A7A7")
                  (cursor-color . "green")
                  ;; (foreground-color . "#F8F8F8")
                  ;; (mouse-color . "sienna1")

                  (height . 30)
                  (width . 100)
                  (left . 200)
                  (top . 20)
                  ;; (visibility . nil)
                  ;;         (font . "fontset-gbk")
                  )
                 (nil ;; if on term
                  ;; (background-color . "#0C1021")
                  ;; (background-mode . dark)
                  ;; (border-color . "black")
                  ;; (cursor-color . "#A7A7A7")
                  ;; (cursor-color . "green")
                  ;; (foreground-color . "#F8F8F8")
                  ;; (mouse-color . "sienna1")
                  ;; (font . "fontset-mymac")
                  )))


(setq-default undo-tree-mode-lighter " Ü") ;undo
(setq-default helm-completion-mode-string " H")

(setq-default mode-line-cleaner-alist
              `((auto-complete-mode . " á")
                (company-mode . " CA")
                (yas-minor-mode . " ý")
                (undo-tree-mode . " Út")
                (golden-ratio-mode . "")
                (flymake-mode . " Fly")
                ;; major mode
                (fundamental-mode . "Fd")
                (ibuffer-mode . "iBuf")
                (python-mode . "Py")
                (lisp-interaction-mode . "iEL")
                (emacs-lisp-mode . "EL")))

(defun clean-mode-line ()
  (interactive)
  (dolist (cleaner mode-line-cleaner-alist)
    (let* ((mode (car cleaner))
           (mode-str (cdr cleaner))
           (old-mode-str (cdr (assq mode minor-mode-alist))))
      (when old-mode-str
        (setcar old-mode-str mode-str))
      ;; major mode
      (when (eq mode major-mode)
        (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

