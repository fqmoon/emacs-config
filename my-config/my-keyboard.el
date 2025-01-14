;;; package --- Summary
;;; Commentary:
;;; 键位设置

;;; Code:

;; 默认情况下在macOS上，option键是super，而cmd是meta
;; 虽然键位变成WIN键位了，但不符合macOS的传统，交换过来
;;(setq mac-option-modifier 'meta
;;      mac-command-modifier 'super)
;; 没有启用，因为键位位置更重要，而非功能

;; MacBook没有右ctrl键，只有右option键
;; Emacs大量的命令都是要用ctrl键的，将右option改成右ctrl
(setq mac-right-option-modifier 'control)
;; 我其实更想把右shift改为右ctrl的，但似乎没有那么容易

(provide 'my-keyboard)
;;; my-keyboard.el ends here
