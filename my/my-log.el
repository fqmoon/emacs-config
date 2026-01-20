;;; -*- lexical-binding: t; -*-

(use-package logview
  :ensure nil
  :config
  ;; config for android logcat log files
  (setq logview-additional-level-mappings
	'(("Android" (error "E" "F") (warning "W") (information "I")
	   (debug "D") (trace "V"))))
  (setq logview-additional-submodes
	'(("Android logcat"
	   (format
	    . "TIMESTAMP <<RX:THREAD:[[:digit:]]+[[:space:]]+[[:digit:]]+>> LEVEL NAME: MESSAGE")
	   (levels . "Android") (timestamp "Android no year"))))
  (setq logview-additional-timestamp-formats
	'(("Android no year" (java-pattern . "MM-dd HH:mm:ss.SSS")))))

(provide 'my-log)
