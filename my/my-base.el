;;; base文件存放所有的基本配置，保证它们不出错
;;; 尽量少依赖于三方包

;; open config file
(defun open-my-config ()
  "打开配置文件."
  (interactive)
  (find-file user-init-file))

;; magit是一个很好用的版本管理包
;; 但是在windows上卡得没法用，在该平台关闭该功能
(when (not (eq system-type 'windows-nt))
  (use-package magit
    :ensure t
    :defer t))

(defun my/copy-all ()
  "拷贝整个缓冲区，不影响光标位置"
  (interactive)
  (let ((cur-pos (point)))
    (kill-ring-save (point-min) (point-max))
    (goto-char cur-pos)))

;; TODO 鼠标

(provide 'my-base)
