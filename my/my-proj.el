(defcustom project-root-markers
  '(".project")
  "标记项目的文件."
  :type '(repeat string)
  :group 'project)

(defun project-root-p (path)
  "判断是否是一个路径是项目根目录."
  (catch 'found
    (dolist (marker project-root-markers)
      (when (file-exists-p (concat path marker))
	(throw 'found marker)))))

(defun project-find-root (path)
  "搜索项目根目录."
  (when-let ((root (locate-dominating-file path #'project-root-p)))
    (cons 'transient root)))

(defun my/project-try-local (dir)
  "Determine if DIR is a non-Git project."
  (catch 'found
    (let ((pr-flags '(".project")))
      (dolist (f pr-flags)
	(when-let ((root (locate-dominating-file dir f)))
          (throw 'found (cons 'transient root)))))))

(use-package project
  :ensure nil
  :config
  (add-to-list 'project-find-functions #'project-find-root))

;; ;; 工作区
;; (use-package perspective
;;   :config
;;   (persp-mode))

(provide 'my-proj)
