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

;; TODO 鼠标

(provide 'my-base)
