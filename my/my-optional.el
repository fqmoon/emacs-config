;;; 可选包

;; vterm是一个终端模拟器，它需要编译，要在系统里安装libtool-bin
(use-package vterm)

;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode)

;; 字幕编辑，支持.srt按时间排序
(use-package subed)

;; 重启功能
(use-package restart-emacs)

(provide 'my-optional)
