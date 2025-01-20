;; 项目管理
(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/Developer/" "~/.emacs.d/"))
  :config
  ;; 使consult的grep相关搜索能正确基于项目根目录
  ;; 当然这需要projectile能正确识别到项目目录
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;; 项目最近文件
  ;; (global-set-key (kbd "C-x p r") 'consult-projectile-recentf)
  
  (projectile-mode t)
  )

;; ;; 工作区
;; (use-package perspective
;;   :config
;;   (persp-mode))

(provide 'my-proj)
