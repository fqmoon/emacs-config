;;; my-term.el --- summary -*- lexical-binding: t -*-

;; Author: 
;; Maintainer: 
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

(defun shell-like-tty (shell-program)
  "Launch a SHELL-PROGRAM on tty like terminal.
w32不支持tty，无法使用term相关命令，该函数用shell来兼容tty的终端。"
  (let* ((buf-name (format "*%s*" shell-program))
	 (buf (get-buffer-create buf-name))
         ;; 1. 强制注入环境变量，覆盖 Bash 的默认行为
         ;; TERM=dumb 告诉 Bash 不要发送复杂的终端控制符
         ;; INSIDE_EMACS 确保子进程知道自己在管道中
         (process-environment (append 
                               '("TERM=dumb" 
                                 "INSIDE_EMACS=t" 
                                 "PS1=$ ") 
                               process-environment)))
    (with-current-buffer buf
      (setq-local explicit-shell-file-name shell-program)
      ;; 2. 启动 shell
      (shell buf)
      
      ;; 3. 在当前 buffer 开启实时过滤
      ;; 解决 ^]0; 这种更新标题的乱码 (ANSI OSC 序列)
      (add-hook 'comint-preoutput-filter-functions
                (lambda (string)
                  ;; 过滤掉 \e]0; 到 \a 之间的所有内容
                  (replace-regexp-in-string "\e]0;.*?\a" "" string))
                nil t)
      
      ;; 解决路径和编码
      (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
      (shell-dirtrack-mode t))))

(defun my-shell-sh ()
  "Launch a shell on sh."
  (interactive)
  (shell-like-tty "sh"))

(defun my-shell-bash ()
  "Launch a shell on bash."
  (interactive)
  (shell-like-tty "bash"))

(provide 'my-term)

;;; my-term.el ends here
