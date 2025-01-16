;;; package --- Summary
;;; Commentary:
;;; 键位设置

;;; Code:

;; 使在macOS上，option键是Super，而cmd是Meta
;; 这样才和Windows键位一致
(setq mac-option-modifier 'super
     mac-command-modifier 'meta)
;; 没有启用，因为键位位置更重要，而非功能

;; MacBook没有右ctrl键，只有右option键
;; Emacs大量的命令都是要用ctrl键的，将右option改成右ctrl
(setq mac-right-option-modifier 'control)
;; 我其实更想把右shift改为右ctrl的，但似乎没有那么容易

;; macOS中，option键默认是A，即Alt
;; 需要映射成Super吗

(provide 'my-keyboard)
;;; my-keyboard.el ends here
