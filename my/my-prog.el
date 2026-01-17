;; 编程用的配置
(add-hook 'prog-mode-hook
	  #'(lambda ()
	     (setq truncate-lines t)
	     (setq word-wrap nil)))

;; eglot是Emacs-29内置的语言服务器
;; eglot可手动启用，先还是用LSP吧
(when nil
  (use-package eglot
    :hook ((js-ts-mode . eglot-ensure)
	   (python-ts-mode . eglot-ensure))
    ))

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

;;(require 'my-prog-treesit)

(use-package lsp-mode
  :ensure t
  :hook
  ((c-mode . lsp-deferred))
  )

(use-package lsp-treemacs
  :ensure t)

(use-package paredit
  :ensure t
  :hook
  ((emacs-lisp-mode . paredit-mode)))

(provide 'my-prog)
