;; 编程用的配置
(add-hook 'prog-mode-hook
	  '(lambda ()
	     (setq truncate-lines t)
	     (setq word-wrap nil)))

;; eglot是Emacs-29内置的语言服务器
(use-package eglot
  :hook (prog-mode . eglot-ensure)
  )

;; ;; treesit
;; ;; 我用(tree
;; (use-package treesit
;;   :init
;;   (setq treesit-language-source-alist
;; 	'((css . ("https://github.com/tree-sitter/tree-sitter-css"))
;; 	  (c . ("https://github.com/tree-sitter/tree-sitter-c"))
;; 	  (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript"))
;; 	  (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
;; 	  (python . ("https://github.com/tree-sitter/tree-sitter-python"))))
;;   :config (setq treesit-font-lock-level 4))

(provide 'my-prog)
