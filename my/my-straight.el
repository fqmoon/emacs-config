;; 安装straight.el包管理器
(with-proxy
  :http-server "127.0.0.1:10810"
  :no-proxy ("localhost" "127.0.0.1" "192.168.*" "10.*")
  (defvar bootstrap-version)
  (let ((bootstrap-file
	 (expand-file-name
          "straight/repos/straight.el/bootstrap.el"
          (or (bound-and-true-p straight-base-dir)
              user-emacs-directory)))
	(bootstrap-version 7))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
	(goto-char (point-max))
	(eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage)))
;; 为straight.el配置源
(setq straight-repository-branch "develop")
(setq straight-vc-git-default-clone-depth 1)
;; TODO 不能使用
(setq straight-recipe-repositories
      '(melpa-stable ))
(straight-pull-recipe-repositories)

(provide 'my-straight)
