;;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :ensure t
  :hook ((c-mode . lsp-deferred)))

(use-package lsp-treemacs
  :ensure t)

(provide 'my-lsp)
