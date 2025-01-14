;; 环境：Emacs-29.1

;; 配置源
(require 'package)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; 总是自动安装所有包
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult-projectile ripgrep subed perspective which-key treesit restart-emacs centaur-tabs buffer-tabs markdown-mode monokai-theme vterm embark-consult keycast consult)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; open config file
(defun edit-my-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;;(global-set-key (kbd "<f2>") 'open-init-file)

;; print OS type
(message "Your system type is %s." system-type)
;; check Emacs version
(if (version< emacs-version "29.1")
    (message "WARN: Emacs version is lower than 29.1 !"))

(use-package magit
  :defer t)

;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :pin "melpa-stable")

;; my configs
(add-to-list 'load-path (expand-file-name "my-config" user-emacs-directory))
(require 'my-keyboard)
(require 'my-ui)
(require 'my-company)
(require 'my-input-method)
(require 'my-other)
(require 'my-search)
(require 'my-proj)
(require 'my-prog)

;; 字幕编辑，支持.srt按时间排序
(use-package subed)
