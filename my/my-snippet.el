;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package yasnippet
  :ensure t
  :hook (prog-mode . yas-minor-mode-on))
(use-package yasnippet-snippets
  :after yasnippet
  :ensure t)
(use-package yasnippet-capf
  :after yasnippet
  :ensure t
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(provide 'my-snippet)
;;; my-snippet.el ends here
