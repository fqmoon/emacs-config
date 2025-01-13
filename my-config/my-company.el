;; 文内补全
(use-package company
  :ensure t
  :config
  (global-company-mode 1))

;; minibuffer company
(use-package vertico
  :config
  (vertico-mode t))
;; 在匹配命令时，可以无序匹配
(use-package orderless
  :config
  (setq completion-styles '(orderless)))
;; 给命令添加边注（注释在右侧）
(use-package marginalia
  :config
  (marginalia-mode t))

;; 类似于鼠标右键菜单，一个上下文语境的命令
(use-package embark
  :config
  (global-set-key (kbd "C-;") 'embark-act))

;; 记录命令历史
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :config (savehist-mode t))

(provide 'my-company)
