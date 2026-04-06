1;;; org-mode config

;; 在中英文之间插入空格的包
(use-package pangu-spacing
  :disabled
  :ensure t
  ;; 在中英文之间加入空格
  (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
  (pangu-spacing-mode t))

(use-package org
  :ensure nil
  :defer t
  :bind (("C-c l" . #'org-store-link)
	 ("C-c a" . #'org-agenda)
	 ("C-c c" . #'org-capture))
  :custom
  (org-directory (file-truename "~/org/"))
  (org-default-notes-file (expand-file-name "inbox.org" org-directory))
  (org-agenda-files (list org-directory))
  (org-startup-indented t)
  ;; 优先使用id建立链接
  (org-id-link-to-org-use-id t)
  ;; 在切换到DONE时自动记录时间
  (org-log-done 'time)
  (org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCEL(c)")))
  ;; 内容被折叠的尾部提示
  (org-ellipsis " ▾")
  ;; 模板中替代词：
  ;; - %U 未激活时间（不会在agenda里面出现）
  ;; - %a 源链接
  ;; - %i 选中内容
  ;; - %? 最终光标停留位置
  (org-capture-templates
   '(("t" "Todo" entry (file "task.org")
      "* TODO %?\n  时间：%T\n  来自：%a\n%i" :prepend t)
     ("i" "Idea" entry (file "idea.org")
      "* TODO %?\n  时间：%U\n  来自：%a\n%i")
     ("d" "Draft" entry (file "draft.org")
      "* TODO %? :IDEA:\n  时间：%U\n  来自：%a\n%i"))))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory org-directory)
  (org-roam-dailies-directory "daily/")
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  ;; 将GC内存范围提升到100MB，提升性能
  (gc-cons-threshold (* 100 1024 1024))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n l" . org-roam-buffer-toggle) ;; 显示后链窗口
	 ("C-c n g" . org-roam-graph)
	 ("C-c n j" . org-roam-dailies-goto-date)
         ("C-c n u" . org-roam-ui-mode)) ;; 浏览器中可视化
  :config
  (org-roam-db-autosync-mode 1))

(use-package org-modern
  :ensure t
  :after org
  :config
  (global-org-modern-mode 1))

(provide 'my-org)
