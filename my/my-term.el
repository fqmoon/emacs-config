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

(defun my-bash-shell ()
  "Launch a shell on bash like terminal, 请先 customize 'explicit-shell-file-name'."
  (interactive)
  (let* (
         ;; 1. 强制注入环境变量，覆盖 Bash 的默认行为
         ;; TERM=dumb 告诉 Bash 不要发送复杂的终端控制符
         ;; INSIDE_EMACS 确保子进程知道自己在管道中
         (process-environment (append 
                               '("TERM=dumb" 
                                 "INSIDE_EMACS=t" 
                                 "PS1=$ ") 
                               process-environment)))
    
    ;; 2. 启动 shell
    (shell "*bash-shell*")
    
    ;; 3. 在当前 buffer 开启实时过滤
    (with-current-buffer "*bash-shell*"
      ;; 解决 ^]0; 这种更新标题的乱码 (ANSI OSC 序列)
      (add-hook 'comint-preoutput-filter-functions
                (lambda (string)
                  ;; 过滤掉 \e]0; 到 \a 之间的所有内容
                  (replace-regexp-in-string "\e]0;.*?\a" "" string))
                nil t)
      
      ;; 解决路径和编码
      (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
      (shell-dirtrack-mode t))))

(provide 'my-term)

;;; my-term.el ends here
