;; 编程用的配置
(add-hook 'prog-mode-hook
	  #'(lambda ()
	     (setq truncate-lines t)
	     (setq word-wrap nil)))

;; eglot是Emacs-29内置的语言服务器
(use-package eglot
  :hook ((js-ts-mode . eglot-ensure)
	 (python-ts-mode . eglot-ensure))
  )

;; 显示列号
;;(add-hook 'prog-mode-hook 'column-number-mode)
;; 代码折叠
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; 代码错误检查
(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (global-set-key (kbd "M-n") 'flymake-goto-next-error)
  (global-set-key (kbd "M-p") 'flymake-goto-prev-error))

;(require 'my-prog-treesit)

(provide 'my-prog)
