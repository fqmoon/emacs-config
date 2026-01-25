;;; package --- Summary
;; TODO 词法作用域一键添加？sniipt么？
;;; Commentary:
;;; Code:

;;; Load font
;; 
(defun my-gui--load-font ()
  "Load font for GUI.
需要安装Sarasa Mono SC字体，windows不自带
地址：https://github.com/be5invis/Sarasa-Gothic
下载后压缩出.ttf文件。linux安装方法－放到~/.local/share/font/下"
  (let ((font-name "Sarasa Mono SC-12"))
    (message "Font=%s" font-name)
    ;; 英文字体
    (set-face-attribute 'default nil
			:font font-name)
    ;; 中文字体
    (set-fontset-font t 'han font-name)
    (set-fontset-font t 'cjk-misc font-name)))
(my-gui--load-font)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  ;; (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  (load-theme 'doom-one))

(defun my-gui-load-theme ()
  (load-theme 'doom-one))

(provide 'my-gui)
;;; my-gui.el ends here
