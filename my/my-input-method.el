;; 设置编码环境，避免org-mode中文卡頓
(set-language-environment "UTF-8")

;; 内置输入法
(use-package pyim
  :ensure t
  ;; 启动后1秒加载，这样才可以按输入法进行搜索
  :defer 1
  :bind (("C-\\" . toggle-input-method))
  :init
  (setq default-input-method "pyim")
  :config
  ;; 输入法能够跟随弹窗
  ;; popup在多windows时出现分裂的情况，用posframe替代
  ;; (use-package popup
  ;;   :ensure t
  ;;   :config
  ;;   (setq pyim-page-tooltip 'popup))
  (use-package posframe
    :ensure t
    :config
    (setq pyim-page-tooltip 'posframe))
  
  ;; 五笔词库
  (use-package pyim-wbdict
    :ensure t
    :config
    (setq pyim-default-scheme 'wubi)
    (pyim-wbdict-v86-enable))

  (require 'pyim-cregexp-utils)
  ;; 在isearch命令中可以用拼音首字母搜索
  (pyim-isearch-mode 1)

  ;; 让 vertico, selectrum 等补全框架，通过 orderless 支持拼音搜索候选项功能。
  ;; https://github.com/tumashu/pyim?tab=readme-ov-file#%E8%AE%A9-vertico-selectrum-%E7%AD%89%E8%A1%A5%E5%85%A8%E6%A1%86%E6%9E%B6%E9%80%9A%E8%BF%87-orderless-%E6%94%AF%E6%8C%81%E6%8B%BC%E9%9F%B3%E6%90%9C%E7%B4%A2%E5%80%99%E9%80%89%E9%A1%B9%E5%8A%9F%E8%83%BD
  (defun my-orderless-regexp (orig-func component)
    (let ((result (funcall orig-func component)))
      (pyim-cregexp-build result)))
  (advice-add 'orderless-regexp :around #'my-orderless-regexp)
  ;; 让 avy 支持拼音搜索
  (with-eval-after-load 'avy
    (defun my-avy--regex-candidates (fun regex &optional beg end pred group)
      (let ((regex (pyim-cregexp-build regex)))
	(funcall fun regex beg end pred group)))
    (advice-add 'avy--regex-candidates :around #'my-avy--regex-candidates))
  )


(provide 'my-input-method)
