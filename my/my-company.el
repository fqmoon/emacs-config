;; 文内补全
;; Corfu is mordern than company
;; For point completion
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode 1))

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
  (("C-;" . embark-act)
   ("C-s" . consult-line))
  :config
  (use-package embark-consult
    :ensure t))

;; Emacs-30已经内置
;; 可以提示组合命令键
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

;; 屏幕内字符跳转
(use-package avy
  :ensure t
  ;; :after org
  :bind
  (("C-'" . avy-goto-char-timer)
   ;; :map org-mode-map
   ;; ("C-j" . avy-goto-char-timer)
   )
  :config
  (setq avy-background t))

(provide 'my-company)
