;; modeline上显示按键和执行的命令
;; (use-package keycast
;;   :config
;;   (keycast-mode-line-mode t))

;; vterm是一个终端模拟器，它需要编译，要在系统里安装libtool-bin
(use-package vterm)

;; 禁止备份文件（后缀名为~）
(setq make-backup-files nil)
;; 禁止自动保存
(setq auto-save-default nil)

;; 自动同步文件修改
;; 加载修改后文件在Emcas中被称为revert
(global-auto-revert-mode 1)

;;;; 鼠标滚轮相关
;; TODO 像素级滚动支持
;; 滚轮速度
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; 水平滚动
(setq mouse-wheel-tilt-scroll t)
;; 水平滚动反向（自然滚动）
(setq mouse-wheel-flip-direction t)
;; 关闭滚轮加速实测不关更好用）
;(setq mouse-wheel-progressive-speed nil)

;; 记录命令历史
(use-package savehist
  :hook (after-init . savehist-mode)
  :config (savehist-mode t))

;; 重启功能
(use-package restart-emacs)

(provide 'my-other)
