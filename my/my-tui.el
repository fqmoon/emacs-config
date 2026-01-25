(when (and (running-in-wsl-p)
	   (not (display-graphic-p)))
  ;; 发送禁用焦点事件
  (send-string-to-terminal "\e[?1004l\e[?1002l\e[?1003l\e[?1005l\e[?1006l")
  (message "已在WSL2 TUI中禁用焦点事件"))

(provide 'my-tui)
