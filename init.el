;; 配置源
(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; 总是自动安装所有包
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(monokai-theme vterm embark-consult keycast popup pyim consult vertico company magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(dolist (p '(orderless marginalia pyim-wbdict))
	(package-install p))

;; open config file
(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;; my configs
(add-to-list 'load-path (expand-file-name "my-config" user-emacs-directory))
(require 'my-keyboard)
(require 'my-ui)
(require 'my-company)
(require 'my-input-method)
(require 'my-other)
(require 'my-search)


;; fix magit
;; https://github.com/magit/magit/issues/5011
(defun seq-keep (function sequence)
  "Apply FUNCTION to SEQUENCE and return the list of all the non-nil results."
  (delq nil (seq-map function sequence)))
