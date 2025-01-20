;;; base文件存放所有的基本配置，保证它们不出错
;;; 尽量少依赖于三方包

;; open config file
(defun open-my-config ()
  "打开配置文件."
  (interactive)
  (find-file user-init-file))

;; git version control
(use-package magit
  :ensure t
  :defer t)

(provide 'my-base)
