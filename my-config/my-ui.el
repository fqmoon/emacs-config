;; line number
;;(global-linum-mode 1)
(global-display-line-numbers-mode 1)
;; 光标（cursor）样式
(setq-default cursor-type 'bar)
;; 显示配对括号
(show-paren-mode t)

;; chinese
;; 设置默认字体和中文字体
;(set-face-attribute 'default nil :font "Ubuntu Mono-14") ;; 替换为你喜欢的英文字体
;(set-fontset-font t 'han (font-spec :family "SimSun")) ;; 替换为你安装的中文字体
;; 设置中英文字符宽度一致（可选）
;(setq face-font-rescale-alist '(("SimSun" . 1.2)))

(use-package monokai-theme
  :config
  (load-theme 'monokai 1))


(provide 'my-ui)
