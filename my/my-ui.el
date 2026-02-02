;;; package --- Summary
;;; Commentary:
;;; Code:

;; line number
;;(global-linum-mode 1)
(global-display-line-numbers-mode 1)
;; hilight line
(global-hl-line-mode 1)

;; 不在modeline中显示行号
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
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; 窗口布局记录和切换
;; C-c <left> 前一个窗口布局
;; C-c <right> 后一个
(winner-mode t)

;; icons
(use-package nerd-icons
  :ensure t)
(use-package nerd-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))
(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

;;; theme and font, etc
(defun apply-ui-config-on-frame (frame)
  "Apply UI config on the FRAME."
  (with-selected-frame frame
    (dolist (theme custom-enabled-themes)
      (disable-theme theme))
    (cond
     ((display-graphic-p frame)
      (require 'my-gui)
      (my-gui-load-theme))
     (t
      (require 'my-tui)
      (my-tui-load-theme))))
  (message "Apply UI config on frame"))
(add-hook 'after-make-frame-functions #'apply-ui-config-on-frame)
(cond
 ;; daemon
 ((daemonp) (add-hook 'server-visit-hook #'apply-ui-config-on-frame))
 ;; not daemon
 (t (apply-ui-config-on-frame (selected-frame))))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  ;; first run need calling `(nerd-icons-install-fonts)` this to install icons
  )


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
;;; my-ui.el ends here
