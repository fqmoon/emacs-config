;;; package --- Summary
;;; Commentary:
;;; 键位设置

;;; Code:

;; for macOS
(when (eq system-type 'darwin)
  ;; macOS上左下角按键依次为fn, super, meta, control
  ;; 这并不会影响command+tab切换应用
  (setq mac-control-modifier 'super
	mac-command-modifier 'control))

(provide 'my-keyboard)
;;; my-keyboard.el ends here
