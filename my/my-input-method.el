;; 内置输入法
(use-package pyim
  :config
  (setq default-input-method "pyim")
  (pyim-isearch-mode 1)			; 在isearch命令中可以用拼音首字母搜索
  ;; 输入法能够跟随弹窗
  (use-package popup
    :config
    (setq pyim-page-tooltip 'popup))
  ;; 五笔词库
  (use-package pyim-wbdict
    :config
    (setq pyim-default-scheme 'wubi)
    (pyim-wbdict-v86-enable)))


(provide 'my-input-method)
