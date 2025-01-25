1;;; org-mode config


(defun fq-org-config ()
  "Config org-mode."
  ;; 不截断，也就是折行的意思
  (setq truncate-lines nil)
  ;; 在中英文之间插入空格的包
  (use-package pangu-spacing
    :ensure t)
  ;; 在中英文之间加入空格
  (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
  (pangu-spacing-mode t))

(use-package org
  :ensure nil
  :defer t
  :hook ((org-mode . fq-org-config))
  :bind (
	 ("C-c l" . #'org-store-link)
	 ("C-c a" . #'org-agenda)
	 ("C-c c" . #'org-capture))
  :config
  (set-face-attribute 'org-level-1 nil :height 1.4) ;; 一级标题大一点
  (set-face-attribute 'org-level-2 nil :height 1.3) ;; 二级标题稍微大
  (set-face-attribute 'org-level-3 nil :height 1.2) ;; 三级标题正常
  (set-face-attribute 'org-level-4 nil :height 1.1) ;; 其他标题较小
  ;; org agenda 相关设置
  (setq org-directory "~/org/")
  ;; 注意这里并没有设置递归寻找，应该用capture功能将todo项引入
  (setq org-agenda-files (list (expand-file-name "agenda/" org-directory)
			       (expand-file-name "todo/" org-directory)
			       (expand-file-name "notes/" org-directory)
			       (expand-file-name "journal/" org-directory)))
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
	   (file+headline ,(expand-file-name "todo/todo.org" org-directory) "Tasks")
	   "* TODO %?\n%U\n%a\n")
	  ;; 临时记录，相当于一个草稿本，需要归档
	  ("n" "Notes" entry
	   (file+headline ,(expand-file-name "notes/notes.org" org-directory) "Notes")
	   "* %?\n%U\n%a\n%i\n")
	  ;; 想法+感悟，就像日记嘛
	  ("j" "Journal" entry
	   (file+datetree ,(expand-file-name "journal/journal.org" org-directory))
	   "* %?\n%a\n"))))

(provide 'my-org)
