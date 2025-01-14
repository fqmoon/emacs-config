;; search tool
(use-package consult
  :config
  ;; 在安装了consult之后，consult-line命令就可以不只匹配一行的开头了
  (use-package embark-consult
    :config  (global-set-key (kbd "C-s") 'consult-line))
  ;; 最近文件
  (recentf-mode t)
  (global-set-key (kbd "C-x C-r") 'consult-recent-file))

(provide 'my-search)
