;; modeline上显示按键和执行的命令
(require 'keycast)
(keycast-mode-line-mode t)

;; vterm是一个终端模拟器，它需要编译，要在系统里安装libtool-bin
;;(require vterm)

;; 禁止备份文件（后缀名为~）
(setq make-backup-files nil)

;; 鼠标滚轮
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;(setq mouse-wheel-progressive-speed nil)

(provide 'my-other)
