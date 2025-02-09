;; 环境：Emacs 29.4-1

;; 配置源
(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; 分离Emacs的custom配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (make-empty-file custom-file))
(load custom-file)

;; straight.el包管理器配置
;;(require 'my-straight)


;; print OS type
(message "Your system type is %s." system-type)
;; check Emacs version
(if (version< emacs-version "29.4")
    (message "WARN: Emacs version is lower than 29.4!"))

;; TODO 光标跳转功能包
;; TODO org中粘贴剪贴板图像 —— org-download

;; my configs
(add-to-list 'load-path (expand-file-name "my" user-emacs-directory))
(require 'my-base)

(require 'my-keyboard)
(require 'my-ui)
(require 'my-company)
(require 'my-input-method)
(require 'my-other)
(require 'my-search)
(require 'my-proj)
(require 'my-prog)
(require 'my-org)


(require 'my-optional)



;; (use-package meow
;;   :ensure t
;;   :config
;;   (defun meow-setup ()
;;       ""
;;     '())
;;   (meow-setup)
;;   (meow-global-mode 1))
