
;;;; company everything
;; company
(global-company-mode 1)
;; minibuffer company
(require 'vertico)
(vertico-mode t)
(require 'orderless)
;; 在匹配命令时，可以无序匹配
(setq completion-styles '(orderless))
;; 给命令添加边注（注释在右侧）
(require 'marginalia)
(marginalia-mode t)
;; 类似于鼠标右键菜单，一个上下文语境的命令
(require 'embark)
(global-set-key (kbd "C-;") 'embark-act)

(provide 'my-company)
