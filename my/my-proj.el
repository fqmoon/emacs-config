(defcustom project-root-markers
  '(".project")
  "标记项目的文件."
  :type '(repeat string)
  :group 'project)

(defun project-root-p (path)
  "判断 PATH 是否是一个路径是项目根目录."
  (catch 'found
    (dolist (marker project-root-markers)
      (when (file-exists-p (concat path marker))
	(throw 'found marker)))))

;; https://andreyor.st/posts/2022-07-16-project-el-enhancements/
(defun project-find-root (path)
  "根据 PATH 搜索项目根目录."
  (when-let ((root (locate-dominating-file path #'project-root-p)))
    (cons 'transient root)))

(use-package project
  :ensure nil
  :config
  (add-to-list 'project-find-functions #'project-find-root))

;; ;; 工作区
;; (use-package perspective
;;   :config
;;   (persp-mode))

(provide 'my-proj)
