;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi))

(defun my-tui-load-theme ()
  (load-theme 'modus-vivendi))

;;; 发送禁用焦点事件
(defun my-tui--disable-xterm ()
  "Disable xterm for TUI."
  (send-string-to-terminal "\e[?1004l\e[?1002l\e[?1003l\e[?1005l\e[?1006l"))
(defun my-tui--tty-setup-func ()
  "Setup tty."
  (when (and (running-in-wsl-p)
	     (not (display-graphic-p)))
    (my-tui--disable-xterm)
    (message "已在WSL2 TUI中禁用焦点事件")))
(add-hook 'tty-setup-hook #'my-tui--tty-setup-func)

(provide 'my-tui)
;;; my-tui.el ends here
