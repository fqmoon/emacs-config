(use-package ripgrep
  :ensure t)

;; search tool
(use-package consult
  :ensure t
  :bind (("M-y" . consult-yank-pop)		; 替换默认的粘贴板
	 ("C-x M-:" . consult-complex-command) ; 历史命令补全
	 ("M-g g" . consult-goto-line)
	 ("M-g i" . consult-imenu)
	 ("M-g I" . consult-imenu-multi) ; 所有buffer里进行imenu
	 ("M-g o" . consult-outline)
	 ("C-x b" . consult-buffer)
	 ("C-x C-r" . consult-recent-file)
	 ("M-s L" . consult-line-multi)	; 跨buffer搜索
	 ;; 项目级字符串搜索
	 ("C-S-s" . consult-ripgrep))
  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)
  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Tweak the register preview for `consult-register-load',
  ;; `consult-register-store' and the built-in commands.  This improves the
  ;; register formatting, adds thin separator lines, register sorting and hides
  ;; the window mode line.
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  
  :config
  ;; 预览功能配置
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; narrow-key 可以过滤结果，和一些过滤标记组合使用。
  ;; 在匹配时，输入该key再选择类型即可过滤
  (setq consult-narrow-key "<") ;; "C-+"
  
  ;; 在安装了consult之后，consult-line命令就可以不只匹配一行的开头了
  (use-package embark-consult
    :ensure t
    :bind (("C-s" . 'consult-line))))

(provide 'my-search)
