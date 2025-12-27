;;; 可选包

;; vterm是一个终端模拟器，它需要编译，要在系统里安装libtool-bin
(when (not (eq system-type 'windows-nt))
  (use-package vterm))

;; TODO 当打开.md文件时，询问安装
;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode)

;; 字幕编辑，支持.srt按时间排序
(use-package subed
  :defer t
  :commands (subed))

;; 重启功能
(use-package restart-emacs
  :defer t)

(provide 'my-optional)
