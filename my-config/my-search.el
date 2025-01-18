;; search tool
(use-package consult
  :bind (
	 ;; 项目级字符串搜索
	 ("C-S-s" . 'consult-ripgrep))
  :config
  ;; 在安装了consult之后，consult-line命令就可以不只匹配一行的开头了
  (use-package embark-consult
    :config  (global-set-key (kbd "C-s") 'consult-line))
  ;; TODO 在 org 中被占用
  (global-set-key (kbd "C-x r") 'consult-recent-file))

(provide 'my-search)
