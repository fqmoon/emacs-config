(use-package ripgrep)

;; 项目管理x
(use-package projectile
  :init
  (setq projectile-project-search-path '("~/Developer/" "~/.emacs.d/"))
  :config
  (projectile-mode t)
  )

;; ;; 工作区
;; (use-package perspective
;;   :config
;;   (persp-mode))

(provide 'my-proj)
