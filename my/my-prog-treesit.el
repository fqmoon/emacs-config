;;; treesit在29版本已经内置，但是需要配置源才能用

(use-package treesit
  :ensure nil
  :defer nil
  :when (treesit-available-p)
  ;;  :hook (after-init-hook . treesit-mode)
  :config
  ;; 配置
  (setq treesit-font-lock-level 4)
  ;; 配置语法源
  (setq treesit-language-source-alist
	'((bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
	  (c          . ("https://github.com/tree-sitter/tree-sitter-c"))
	  (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
	  (css        . ("https://github.com/tree-sitter/tree-sitter-css"))
	  (cmake      . ("https://github.com/uyha/tree-sitter-cmake"))
	  (csharp     . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
	  (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
	  (elisp      . ("https://github.com/Wilfred/tree-sitter-elisp"))
	  (go         . ("https://github.com/tree-sitter/tree-sitter-go"))
	  (gomod      . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
	  (html       . ("https://github.com/tree-sitter/tree-sitter-html"))
	  (java       . ("https://github.com/tree-sitter/tree-sitter-java.git"))
	  (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
	  (json       . ("https://github.com/tree-sitter/tree-sitter-json"))
	  (lua        . ("https://github.com/Azganoth/tree-sitter-lua"))
	  (make       . ("https://github.com/alemuller/tree-sitter-make"))
	  (markdown   . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
	  (ocaml      . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
	  (org        . ("https://github.com/milisims/tree-sitter-org"))
	  (python     . ("https://github.com/tree-sitter/tree-sitter-python"))
	  (php        . ("https://github.com/tree-sitter/tree-sitter-php"))
	  ;; 版本不兼容，使用老版本
	  ;; https://genehack.blog/2024/02/fixing-an-emacs-typescript-ts-mode-problem/
	  (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "v0.20.3" "typescript/src"))
	  (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
	  (ruby       . ("https://github.com/tree-sitter/tree-sitter-ruby"))
	  (rust       . ("https://github.com/tree-sitter/tree-sitter-rust"))
	  (sql        . ("https://github.com/m-novikov/tree-sitter-sql"))
	  (vue        . ("https://github.com/merico-dev/tree-sitter-vue"))
	  (yaml       . ("https://github.com/ikatyang/tree-sitter-yaml"))
	  (toml       . ("https://github.com/tree-sitter/tree-sitter-toml"))
	  (zig        . ("https://github.com/GrayJack/tree-sitter-zig"))))
  ;; 代理包
  (use-package with-proxy
    :ensure t)
  ;; TOOD 代理应该可从外部配置
  ;; 安装语法的函数
  (defun install-lang (lang)
    (if (not (treesit-language-available-p lang))
	;; TODO 写成宏
	(with-proxy
	  :http-server "127.0.0.1:10810"
	  :no-proxy ("localhost" "127.0.0.1" "192.168.*" "10.*")
	  (treesit-install-language-grammar lang))))
  ;; 安装语法
  (install-lang 'typescript)
  (install-lang 'javascript)
  (install-lang 'markdown)
  ;; hook
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.d\\.ts\\'" . typescript-ts-mode))
  (setq major-mode-remap-alist
	'((sh-mode         . bash-ts-mode)
	  (c-mode          . c-ts-mode)
	  (c++-mode        . c++-ts-mode)
	  (c-or-c++-mode   . c-or-c++-ts-mode)
	  (css-mode        . css-ts-mode)
	  (js-mode         . js-ts-mode)
	  (javascript-mode . js-ts-mode)
	  (java-mode       . java-ts-mode)
	  (js-json-mode    . json-ts-mode)
	  (makefile-mode   . cmake-ts-mode)
	  (python-mode     . python-ts-mode)
	  (ruby-mode       . ruby-ts-mode)
	  (conf-toml-mode  . toml-ts-mode))))

(provide 'my-prog-treesit)
