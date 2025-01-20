;; line number
;;(global-linum-mode 1)
(global-display-line-numbers-mode 1)
;; 光标（cursor）样式
(setq-default cursor-type 'bar)
;; 显示配对括号
(show-paren-mode t)

;; chinese
;; 设置默认字体和中文字体
;(set-face-attribute 'default nil :font "Ubuntu Mono-14") ;; 替换为你喜欢的英文字体
;(set-fontset-font t 'han (font-spec :family "SimSun")) ;; 替换为你安装的中文字体
;; 设置中英文字符宽度一致（可选）
;(setq face-font-rescale-alist '(("SimSun" . 1.2)))

;; (use-package monokai-theme
;;   :ensure t
;;   :config
;;   (load-theme 'monokai t))

;; 标签页
;; (use-package tab-bar
;;   :init
;;   (tab-bar-mode t)
;;   :config
;;   (setq tab-bar-show t)			; 总是显示tab
;;   )

;; 类似于VSCODE的标签页
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
  ("M-]" . centaur-tabs-forward)
  )

;; 显示水平滚动条
(setq-default horizontal-scroll-bar-mode t)
(setq-default scroll-bar-mode 'both)

;;(require 'my-ui-treemacs)

(provide 'my-ui)
