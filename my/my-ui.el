;; line number
;;(global-linum-mode 1)
(global-display-line-numbers-mode 1)
;; 不在下方状态栏中显示行号
(line-number-mode 0)
;; 光标（cursor）样式
(setq-default cursor-type 'bar)
;; 显示配对括号
;; replace original paren-mode by rainbow-paren
;; (show-paren-mode 0)
(use-package rainbow-delimiters
  :ensure t
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))


(tool-bar-mode 0)
(scroll-bar-mode 0)

;; 窗口布局记录和切换
;; C-c <left> 前一个窗口布局
;; C-c <right> 后一个
(winner-mode t)


;; chinese
;; 设置默认字体和中文字体
;(set-face-attribute 'default nil :font "Ubuntu Mono-14") ;; 替换为你喜欢的英文字体
;(set-fontset-font t 'han (font-spec :family "SimSun")) ;; 替换为你安装的中文字体

;; (use-package nerd-icons
;;   :ensure t)

;; Windows的默认字体过丑
(when (or (eq system-type 'windows-nt)
	  (eq system-type 'gnu/linux))
  (setq fonts '("Consolas" "微软雅黑"))
  (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend)
  ;; (set-face-attribute 'default nil :font
                      ;; (format "%s:pixelsize=%d" (car fonts) 20))
  ;; 修正GUI的中文字体笔画粗细不一样的问题
  (if (display-graphic-p)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family (car (cdr fonts))))))
  )
;; 设置中英文字符宽度一致（可选）
;; (setq face-font-rescale-alist '(("微软雅黑" . 1.0)))

;; 主题
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  ;; (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  (load-theme 'doom-dark+))



;; 标签页
;; (use-package tab-bar
;;   :init
;;   (tab-bar-mode t)
;;   :config
;;   (setq tab-bar-show t)			; 总是显示tab
;;   )

;; 类似于VSCODE的标签页
(if nil
(use-package centaur-tabs
  ;;:pin "melpa-stable"
  :ensure t
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-group-by-projectile-project) ; 按项目显示buffer
  (setq centaur-tabs-cycle-scope 'tabs)	     ; 仅在当前可见组内部切换标签页，不跨组
  (centaur-tabs-change-fonts "arial" 120)    ; font size & height
  :bind
  ;; "C-M-["不可被映射，因为组合键C-[等同于按住ESC，按不出来的
  ;; 按一下 C-[ 等同于按一下esc，也等同于按住 Meta
  ;; 也可以用 ESC [ 按出来
  ("M-[" . centaur-tabs-backward)
  ;; 也可以用 ESC ] 按出来
  ("M-]" . centaur-tabs-forward))
)

;; 显示水平滚动条
(setq-default horizontal-scroll-bar-mode t)
(setq-default scroll-bar-mode 'both)

;;(require 'my-ui-treemacs)

(provide 'my-ui)
