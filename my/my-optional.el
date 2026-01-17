;;; -*- lexical-binding: t; -*-
;;; 可选包


(defun my/interactive-install-package (pkg)
  (unless (package-installed-p pkg)
    (when (y-or-n-p (format "%s not installed, install it now? " pkg))
      (package-refresh-contents)
      (package-install pkg)))
  (package-installed-p pkg))

(defun my/with-package (pkg fn)
  "Install PKG and run FN."
  (if (my/interactive-install-package pkg)
      (funcall fn)))


;; install subed to edit .srt files
(defun srt-file-p ()
  (and buffer-file-name
       (string-match-p "\\.srt\\'" buffer-file-name)))
(defun try-subed ()
  (my/with-package
   'subed
   (lambda ()
     (require 'subed))))
(defun srt-file-hook ()
  (if (srt-file-p)
      (try-subed)))
(add-hook 'find-file-hook #'srt-file-hook)


;; vterm是一个终端模拟器，它需要编译，要在系统里安装libtool-bin 
(use-package vterm
  :ensure t
  :if (not (eq system-type 'windows-nt)))


;; markdown
;; https://jblevins.org/projects/markdown-mode/
(defun markdown-file-p ()
  (and buffer-file-name
       (string-match-p "\\.md\\'" buffer-file-name)))
(defun try-markdown ()
  (my/with-package
   'markdown-mode
   (lambda ()
     (require 'markdown-mode))))
(defun md-file-hook ()
  (if (markdown-file-p)
      (try-markdown)))
(add-hook 'find-file-hook #'md-file-hook)

(provide 'my-optional)
