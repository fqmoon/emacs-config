1;;; org-mode config


(defun fq-org-config ()
  "Config org-mode."
  ;; 不截断，也就是折行的意思
  (setq truncate-lines nil)
  ;; 在中英文之间插入空格的包
  (use-package pangu-spacing
    :ensure t)
  ;; 在中英文之间加入空格
  (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)
  (pangu-spacing-mode t))

(use-package org
  :ensure nil
  :defer t
  :hook ((org-mode . fq-org-config))
  :bind (
	 ("C-c l" . #'org-store-link)
	 ("C-c a" . #'org-agenda)
	 ("C-c c" . #'org-capture)
	 :map org-mode-map
	 ("C-j" . avy-goto-char-timer)))

(provide 'my-org)
