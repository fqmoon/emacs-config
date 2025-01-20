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
	 ("C-c c" . #'org-capture)
	 :map org-mode-map
	 ("C-j" . avy-goto-char-timer))
  :config
  ;; org agenda 相关设置
  (setq org-directory "~/org/")
  ;; 注意这里并没有设置递归寻找，应该用capture功能将todo项引入
  (setq org-agenda-files (list (expand-file-name "agenda/" org-directory)
			       (expand-file-name "todo/" org-directory)
			       (expand-file-name "notes/" org-directory)
			       (expand-file-name "journal/" org-directory)))
  (setq org-capture-templates
	`(("t" "Todo" entry
	   (file+headline ,(expand-file-name "todo/todo.org" org-directory) "Tasks")
	   "* TODO %?\n  %U\n  %a")
	  ("n" "Notes" entry
	   (file+datetree ,(expand-file-name "notes/notes.org" org-directory))
	   "* %?\n  %U\n  %a")
	  ("j" "Journal" entry
	   (file+datetree ,(expand-file-name "journal/journal.org" org-directory))
	   "* %U %?\n  %i\n  %a"))))

(provide 'my-org)
