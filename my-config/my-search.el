;; search tool
(require 'consult)
(require 'embark-consult)
;; 在安装了consult之后，consult-line命令就可以不只匹配一行的开头了
(global-set-key (kbd "C-s") 'consult-line)

(provide 'my-search)
