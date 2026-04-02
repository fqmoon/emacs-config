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
  :bind (
	 ("C-c l" . #'org-store-link)
	 ("C-c a" . #'org-agenda)
	 ("C-c c" . #'org-capture))
  :config
  ;; org agenda 相关设置
  (setq org-directory "~/org/")
  ;; 注意这里并没有设置递归寻找，应该用capture功能将todo项引入
  (setq org-agenda-files (list (expand-file-name "agenda/" org-directory)))
  ;; 参考：https://www.zmonster.me/2018/02/28/org-mode-capture.html
  ;; 模板中替代词：
  ;; - %U 未激活时间
  ;; - %a 源链接
  ;; - %i 选中内容
  ;; - %? 最终光标停留位置
  (setq org-capture-templates
	`(
	  ;; 任务列表
	  ("t" "Todo" entry
	   (file+headline ,(expand-file-name "agenda/todo.org" org-directory) "Tasks")
	   "* TODO %?\n%U\n%a\n")
	  ;; 草稿本，里面的记录需要归档
	  ("d" "Draft" entry
	   (file+headline ,(expand-file-name "agenda/draft.org" org-directory) "Draft")
	   "* %?\n%U\n%a\n%i\n")
	  ;; 想法+感悟，就像日记嘛
	  ("j" "Journal" entry
	   (file+datetree ,(expand-file-name "agenda/journal.org" org-directory))
	   "* %?\n%a\n"))))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org-roam/"))
  (org-roam-dailies-directory "daily/")
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n l" . org-roam-buffer-toggle) ;; 显示后链窗口
	 ("C-c n g" . org-roam-graph)
	 ("C-c n j" . org-roam-dailies-goto-date)
         ("C-c n u" . org-roam-ui-mode)) ;; 浏览器中可视化
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))

(provide 'my-org)
