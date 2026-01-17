;;; package --- Summary
;;; Commentary:
;;; 键位设置

;;; Code:
(defvar my-remap-keybinding?
       (file-exists-p (expand-file-name ".remap-keybinding" user-emacs-directory)))
       
;; 非mac键盘
;; 非mac键盘本身的键位就不太合理，最重要的Ctrl在最左下角，
;;   而没有用的Win键和Alt键更好按
;; 应该考虑修改OS本身的键位，而不仅仅是对Emacs修改
;; 修改的方案中：
;; - 必改项：左Alt映射成左Ctrl
;; - 可选项：因为左Alt没有了，可以考虑把左Win或者左Ctrl改成左Alt，但也可以不改
;; 如果使用上面说的这些在OS层面的改键，就不需要在Emacs中改键了
;; 
;; 当然有的电脑可能不方便在OS层面改键，那在Emacs之中改也行
;; TODO 这里的代码并不能生效
(when (and (not (eq system-type 'darwin))
	   my-remap-keybinding?)
  ;; (define-key key-translation-map (kbd "<left-alt>") 'control)
  (setq w32-alt-modifier 'control)
  )

;; mac键盘
(when (and (eq system-type 'darwin)
	   my-remap-keybinding?)
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


(if nil
    (progn
      (defun meow-setup ()
	(setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
	(meow-motion-define-key
	 '("j" . meow-next)
	 '("k" . meow-prev)
	 '("<escape>" . ignore))
	(meow-leader-define-key
	 ;; Use SPC (0-9) for digit arguments.
	 '("1" . meow-digit-argument)
	 '("2" . meow-digit-argument)
	 '("3" . meow-digit-argument)
	 '("4" . meow-digit-argument)
	 '("5" . meow-digit-argument)
	 '("6" . meow-digit-argument)
	 '("7" . meow-digit-argument)
	 '("8" . meow-digit-argument)
	 '("9" . meow-digit-argument)
	 '("0" . meow-digit-argument)
	 '("/" . meow-keypad-describe-key)
	 '("?" . meow-cheatsheet))
	(meow-normal-define-key
	 '("0" . meow-expand-0)
	 '("9" . meow-expand-9)
	 '("8" . meow-expand-8)
	 '("7" . meow-expand-7)
	 '("6" . meow-expand-6)
	 '("5" . meow-expand-5)
	 '("4" . meow-expand-4)
	 '("3" . meow-expand-3)
	 '("2" . meow-expand-2)
	 '("1" . meow-expand-1)
	 '("-" . negative-argument)
	 '(";" . meow-reverse)
	 '("," . meow-inner-of-thing)
	 '("." . meow-bounds-of-thing)
	 '("[" . meow-beginning-of-thing)
	 '("]" . meow-end-of-thing)
	 '("a" . meow-append)
	 '("A" . meow-open-below)
	 '("b" . meow-back-word)
	 '("B" . meow-back-symbol)
	 '("c" . meow-change)
	 '("d" . meow-delete)
	 '("D" . meow-backward-delete)
	 '("e" . meow-next-word)
	 '("E" . meow-next-symbol)
	 '("f" . meow-find)
	 '("g" . meow-cancel-selection)
	 '("G" . meow-grab)
	 '("h" . meow-left)
	 '("H" . meow-left-expand)
	 '("i" . meow-insert)
	 '("I" . meow-open-above)
	 '("j" . meow-next)
	 '("J" . meow-next-expand)
	 '("k" . meow-prev)
	 '("K" . meow-prev-expand)
	 '("l" . meow-right)
	 '("L" . meow-right-expand)
	 '("m" . meow-join)
	 '("n" . meow-search)
	 '("o" . meow-block)
	 '("O" . meow-to-block)
	 '("p" . meow-yank)
	 '("q" . meow-quit)
	 '("Q" . meow-goto-line)
	 '("r" . meow-replace)
	 '("R" . meow-swap-grab)
	 '("s" . meow-kill)
	 '("t" . meow-till)
	 '("u" . meow-undo)
	 '("U" . meow-undo-in-selection)
	 '("v" . meow-visit)
	 '("w" . meow-mark-word)
	 '("W" . meow-mark-symbol)
	 '("x" . meow-line)
	 '("X" . meow-goto-line)
	 '("y" . meow-save)
	 '("Y" . meow-sync-grab)
	 '("z" . meow-pop-selection)
	 '("'" . repeat)
	 '("<escape>" . ignore)))
      (require 'meow)
      (meow-setup)
      (meow-global-mode 1)))

;; laeder-key config
;; TODO define leader-key variable
(global-unset-key (kbd "C-z"))
(defvar my/leader-map
  (make-sparse-keymap)
  "Personal leader keymap.")
(global-set-key (kbd "C-z") my/leader-map)
(define-key my/leader-map (kbd "f f") #'consult-find)

(define-key my/leader-map (kbd "w v") #'split-window-right)
(define-key my/leader-map (kbd "w h") #'split-window-below)

(define-key my/leader-map (kbd "F n") #'make-frame-command)
(define-key my/leader-map (kbd "F k") #'delete-frame)

(global-set-key (kbd "M-1") #'delete-other-windows)
(global-set-key (kbd "M-0") #'delete-window)

(provide 'my-keyboard)
;;; my-keyboard.el ends here
