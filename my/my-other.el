;; modeline上显示按键和执行的命令
;; (use-package keycast
;;   :config
;;   (keycast-mode-line-mode t))

;; 一些命令可以按最后一个键以重复
;; 比如切换buffer可以C-x <leaf> <leaf> <leaf> ...
;; 切换windows可以C-o o o o ...
;; (use-package repeat
;;   :ensure nil
;;   :hook (after-init . repeat-mode))

;;; emacs-30原生支持大量repeat配置，包括window、buffer、winner、text-scale改变
(repeat-mode 1)

;; 禁止备份文件（后缀名为~）
(setq make-backup-files nil)
;; 禁止自动保存
(setq auto-save-default nil)

;; 自动同步文件修改
;; 加载修改后文件在Emcas中被称为revert
(global-auto-revert-mode 1)

;;;; 鼠标滚轮相关
;; Emacs-29支持像素级滚动，不再停止在字符的开头
;; 不过这个特性Windows并不支持……又是被抛弃的一天
(setq pixel-scroll-precision-mode t)
;; 滚轮速度
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
;; 滚轮开启水平滚动
(setq mouse-wheel-tilt-scroll t)
;; Disable half-scroll when pointer out of screen
(setq scroll-conservatively 101)
;; 水平滚动反向（自然滚动）
;; 在macos中，需要反向
;; 其余系统不需要
(cond
 ((eq system-type 'darwin)
  (setq mouse-wheel-flip-direction t))
 (t
  (setq mouse-wheel-flip-direction nil)))
;; 关闭滚轮加速 unless macOS
(unless (eq system-type 'darwin)
  (setq mouse-wheel-progressive-speed nil))

;; 记录命令历史
(use-package savehist
  :hook (after-init . savehist-mode)
  :config (savehist-mode t))

;; 打开文件历史
(use-package recentf
  :config
  (setq recentf-max-saved-items 500) 	; 最多xxx个最近文件记录
  (recentf-mode t))

;; 跳转到引用
;; defult key is: M-?, 但被macOS占用
(global-set-key (kbd "C-c r") 'xref-find-references)

;; recurive-edit, C-M-c to exit
(global-set-key (kbd "C-c C-e") #'recursive-edit)

;; auto insert matched parentless
(electric-pair-mode 1)

(global-set-key (kbd "C-x k") #'kill-current-buffer)
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "C-x C-b") #'ibuffer)

(global-set-key (kbd "C-<up>") #'scroll-down-line)
(global-set-key (kbd "C-<down>") #'scroll-up-line)

(provide 'my-other)
