;;; package --- Summary
;;; Commentary:
;;; 键位设置

;;; Code:

;; for macOS
(when (eq system-type 'darwin)
  ;; 首先在系统层面中将fn与control键交换
  ;; 于是按照下面的映射之后
  ;;   左下角按键依次为super(command), fn, meta, control
  ;;   而空格键右边的按钮依次为meta, control
  ;; ctrl和alt在一起，用一个指头可以同时按下
  ;; 这并不会影响command+tab切换窗口，也不会影响command+SPC调用聚焦搜索
  ;;   当然，像新建窗口、关闭窗口这些操作是被变更了的
  (setq mac-control-modifier 'super
	mac-command-modifier 'control
	mac-right-command-modifier 'meta
	mac-right-option-modifier 'control))

(provide 'my-keyboard)
;;; my-keyboard.el ends here
