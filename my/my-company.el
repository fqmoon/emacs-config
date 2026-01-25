;; 文内补全
;; Corfu is mordern than company
;; For point completion
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode 1))
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

(provide 'my-company)
