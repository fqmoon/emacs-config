;;; package --- Summary -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;;; base文件存放所有的基本配置，保证它们不出错
;;; 尽量少依赖于三方包

;; open config file
(defun my/open-config ()
  "打开配置文件."
  (interactive)
  (find-file user-init-file))

(defun my/path-convert (path)
  "转换路径斜线为windows风格."
  (replace-regexp-in-string "/" "\\\\" path))

(defun my/open-explorer ()
  "打开当前文件所在文件夹."
  (interactive)
  (let ((dir (file-name-directory (or buffer-file-name
				      default-directory)))
	(dir-cmd (cdr (assoc system-type
			     '((windows-nt . "explorer")
			       (darwin . "open")
			       (gnu/linux . "xdg-open"))))))
    (cond ((eq dir-cmd nil)
	   "Unknown system")
	  (t
	   (let ((cmd (concat dir-cmd
			      " \""
			      (my/path-convert	dir)
			      "\"")))
	     (print cmd)
	     (async-shell-command cmd))))))

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

;; WSL?
(defun running-in-wsl-p ()
  "Emacs is running in wsl."
  (and (eq system-type 'gnu/linux)
       (with-temp-buffer
	 (insert-file-contents "/proc/version")
	 (goto-char (point-min))
	 (search-forward "WSL" nil t))))

(defun running-on-wayland-p ()
  "Emacs is running on Wayland."
  (not (string-empty-p
	(getenv "WAYLAND_DISPLAY"))))

(if (and
     (running-in-wsl-p)
     (running-on-wayland-p))
    (progn
      (message "Running in WSL on Wayland, now set clipboard. You must install the wl-clipboard program.")
      ;; 使用 wl-copy 复制文本到系统剪贴板
      (defun my/wsl-copy (text &optional push)
	(let ((process-connection-type nil))
	  (let ((proc (start-process "wl-copy" nil "wl-copy")))
	    (process-send-string proc text)
	    (process-send-eof proc))))

      ;; 使用 wl-paste 从系统剪贴板粘贴文本
      (defun my/wsl-paste ()
	(shell-command-to-string "wl-paste --no-newline"))

      ;; 激活这两个函数为 Emacs 的剪贴板交互函数
      (setq interprogram-cut-function #'my/wsl-copy)
      (setq interprogram-paste-function #'my/wsl-paste)))


;; TODO 鼠标

(provide 'my-base)
;;; my-base.el
