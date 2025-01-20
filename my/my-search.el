;; search tool
(use-package consult
  :ensure t
  :bind (
	 ("C-x C-r" . 'consult-recent-file)
	 ;; 项目级字符串搜索
	 ("C-S-s" . 'consult-ripgrep))
  :config
  ;; 在安装了consult之后，consult-line命令就可以不只匹配一行的开头了
  (use-package embark-consult
    :ensure t
    :bind (("C-s" . 'consult-line))))

(provide 'my-search)
