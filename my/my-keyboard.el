;;; package --- Summary
;;; Commentary:
;;; 键位设置

;;; Code:

;; 非mac键盘
;; 非mac键盘本身的键位就不太合理，最重要的Ctrl在最左下角，
;;   而没有用的Win键和Alt键更好按
;; 应该考虑修改OS本身的键位，而不仅仅是对Emacs修改
;; 修改的方案中：
;; - 必改项：左Alt映射成左Ctrl
;; - 可选项：因为左Alt没有了，可以考虑把左Win或者左Ctrl改成左Alt
;; 如果使用上面说的这些在OS层面的改键，就不需要在Emacs中改键了
;; 
;; 当然有的电脑可能不方便在OS层面改键，那在Emacs之中改也行
(when (and (not (eq system-type 'darwin))
	   (file-exists-p (expand-file-name ".keybinding" user-emacs-directory)))
  (define-key key-translation-map (kbd "<left-alt>") 'control)
  (define-key key-translation-map (kbd "<left-super>") 'meta))

;; mac键盘
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
