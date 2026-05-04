;;; package --- Summary
;;; Commentary:
;;; Code:

(defun my-tui-load-theme ()
 (unless custom-enabled-themes
   (load-theme 'modus-vivendi)))

(use-package modus-themes
  :ensure t
  :config
  (my-tui-load-theme))

;;; 让终端显示光标为方块
(unless (display-graphic-p)
  (send-string-to-terminal "\e[2 q"))

(defun my-true-color-p ()
  "Is true-color supported."
  (> (display-color-cells) 256))

(unless (my-true-color-p)
  (message "[WARN] Not support true color! %s"
	   "Please insert 'export COLORTERM=truecolor' into '.bashrc'."))

;; for mouse click
(xterm-mouse-mode 1)

(provide 'my-tui)
;;; my-tui.el ends here
