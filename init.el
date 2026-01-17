;;; -*- lexical-binding: t; -*-
;; 环境：Emacs 29.4-1 -> 30.1

;; my config scripts
(defvar my-path
  (expand-file-name "my"
		    (file-name-directory load-file-name)))
(add-to-list 'load-path my-path)

;; 配置源
(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
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
(require 'my-ai)


;; TODO move to my-jump
;; (use-package better-jumper
;;   :ensure t
;;   :preface
;;   (require 'ring)
;;   :init
;;   (better-jumper-mode 1)
;;   :bind (("M-[" . better-jumper-jump-backward)
;;          ("M-]" . better-jumper-jump-forward)))

(require 'my-optional)

;; 将bash环境传入emacs
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

