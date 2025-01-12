
;; input method
(require 'popup)
(setq pyim-page-tooltip 'popup)
(require 'pyim)
(setq default-input-method "pyim")
(pyim-isearch-mode 1)
(require 'pyim-wbdict)
(setq pyim-default-scheme 'wubi)
(pyim-wbdict-v86-enable)

(provide 'my-input-method)
