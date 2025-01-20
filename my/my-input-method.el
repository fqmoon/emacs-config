;; 内置输入法
(use-package pyim
  :ensure t
  :bind (("M-j" . toggle-input-method))
  :init
  (setq default-input-method "pyim")
  :config
  (pyim-isearch-mode 1)			; 在isearch命令中可以用拼音首字母搜索
  ;; 输入法能够跟随弹窗
  (use-package popup
    :ensure t
    :config
    (setq pyim-page-tooltip 'popup))
  ;; 五笔词库
  (use-package pyim-wbdict
    :ensure t
    :config
    (setq pyim-default-scheme 'wubi)
    (pyim-wbdict-v86-enable)))


(provide 'my-input-method)
