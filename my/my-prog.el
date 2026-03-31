;; 编程用的配置

;; eglot是Emacs-29内置的语言服务器
;; eglot可手动启用，先还是用LSP吧
(when nil
  (use-package eglot
    :hook ((js-ts-mode . eglot-ensure)
	   (python-ts-mode . eglot-ensure))
    ))
(use-package consult-eglot
  :ensure t
  :after ((consult eglot))
  :bind (:map global-map ("M-g M-g" . consult-eglot-symbols)))
(use-package consult-eglot-embark
  :ensure t
  :after (consult-eglot)
  :config
  (consult-eglot-embark-mode 1))

;;; breadcrumb是一个用于eglot和tree-sitter的显示代码结构导航条的扩展包
(use-package breadcrumb
  :ensure t
  :config
  (breadcrumb-mode 1))

(use-package eldoc
  :config
  (setq eldoc-idle-delay 0.1))

;; 显示列号
;;(add-hook 'prog-mode-hook 'column-number-mode)
;; 代码折叠
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; 代码错误检查
(use-package flymake
  :hook (prog-mode . flymake-mode)
  :init
  (add-to-list 'elisp-flymake-byte-compile-load-path my-path) ;; for flymake compiling
  :config
  (global-set-key (kbd "M-g e") #'consult-flymake)
  )
;; fix errors in code
(use-package attrap
  :ensure t
  :bind ("C-c C-a" . attrap-attrap))

;;(require 'my-prog-treesit)

(use-package paredit
  :ensure t
  :hook
  ((emacs-lisp-mode . paredit-mode)))

;; cmake
(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)))
(use-package eldoc-cmake
  :ensure t
  :hook ((cmake-mode . eldoc-cmake-enable)))

(use-package typescript-mode
  :ensure t
  :mode ("\\.tsx?\\'"))

(provide 'my-prog)
