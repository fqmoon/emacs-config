;; modeline上显示按键和执行的命令
(require 'keycast)
(keycast-mode-line-mode t)

;; vterm是一个终端模拟器，它需要编译，要在系统里安装libtool-bin
;;(require vterm)

;; 禁止备份文件（后缀名为~）
(setq make-backup-files nil)
;; 禁止自动保存
(setq auto-save-default nil)

;; 自动同步文件修改
;; 加载修改后文件在Emcas中被称为revert
(global-auto-revert-mode 1)

;; 鼠标滚轮
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;(setq mouse-wheel-progressive-speed nil)

(provide 'my-other)
