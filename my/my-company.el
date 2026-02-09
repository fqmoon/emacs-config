;; 文内补全
;; Corfu is mordern than company
;; For point completion
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode 1))
;;; corfu in tui.
(use-package corfu-terminal
  :if (and (not (display-graphic-p))
	   (< emacs-major-version 31))
  :ensure t
  :config
  (corfu-terminal-mode 1))
;; show icons in corfu
(use-package nerd-icons-corfu
  :ensure t
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

;; minibuffer company
(use-package vertico
  :ensure t
  :config
  (vertico-mode t))
;; 在匹配命令时，可以无序匹配
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))
;; 给命令添加边注（注释在右侧）
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode t))

;; 类似于鼠标右键菜单，一个上下文语境的命令
(use-package embark
  :ensure t
  :bind
  (("M-'" . embark-act)))
(use-package embark-consult
  :after consult
  :ensure t
  :hook ((embark-collect-mode . consult-preview-at-point-mode)))
(use-package wgrep
  :ensure t
  :init
  (setq wgrep-auto-save-buffer t)
  :config
  (define-key grep-mode-map (kbd "C-c C-e") #'wgrep-change-to-wgrep-mode))

;; Emacs-30已经内置
;; 可以提示组合命令键
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

;; 屏幕内字符跳转
(use-package avy
  :ensure t
  :bind
  (("M-j" . avy-goto-char-2)
   ;; :map org-mode-map
   ;; ("C-j" . avy-goto-char-timer)
   )
  :config
  (setq avy-background t))

(use-package cape
  :ensure t
  :init
  ;; 全局添加一些通用的补全后端
  ;; 优先级：LSP > 关键字 > 文件 > Dabbrev（其他buffer的单词）
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  :config
  ;; 配置 dabbrev 扫描其他 buffer（对前后端分离项目很有用）
  (setq cape-dabbrev-min-length 2)
  (setq cape-dabbrev-check-other-buffers t)
  ;; 文件路径补全配置（写 import 路径时触发）
  (setq cape-file-directory-must-exist t)
  (setq cape-file-add-slash-on-enter t)
  ;; eglot
  (cl-labels ((setup-capf ()
		(setq-local completion-at-point-functions
			    (list (cape-capf-super
				   #'eglot-completion-at-point
				   #'cape-file
				   #'cape-dabbrev
				   #'cape-keyword)))))
    (add-hook 'eglot-managed-mode-hook #'setup-capf)))

(provide 'my-company)
