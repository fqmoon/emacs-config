;;; org-mode config

;; 在中英文之间插入空格的包
(use-package pangu-spacing)

(add-hook 'org-mode-hook
	  (lambda ()
	    ;; 不截断，也就是折行的意思
	    (setq truncate-lines nil)
	    ;; point在行内时起headline
	    (setq org-M-RET-may-split-line nil)
	    ;; 在中英文之间加入空格
	    (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
	    (pangu-spacing-mode t)))

;; bind
(define-key org-mode-map (kbd "C-j") 'avy-goto-char-timer)

(provide 'my-org)
