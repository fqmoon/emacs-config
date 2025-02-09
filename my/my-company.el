;; 文内补全
(use-package company
  :ensure t
  :config
  (global-company-mode 1))

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
  :config
  (global-set-key (kbd "C-;") 'embark-act)
  ;; 在安装了consult之后，consult-line命令就可以不只匹配一行的开头了
  (use-package embark-consult
    :ensure t
    :bind (("C-s" . 'consult-line))))

;; Emacs-30已经内置
;; 可以提示组合命令键
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

;; 屏幕内字符跳转
(use-package avy
  :ensure t
  :after org
  :bind
  (("M-j" . avy-goto-char-timer)
   ;; :map org-mode-map
   ;; ("C-j" . avy-goto-char-timer)
   )
  :config
  (setq avy-background t))

(provide 'my-company)
