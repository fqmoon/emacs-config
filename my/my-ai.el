(use-package gptel
  :ensure t
  :bind (:map global-map
	      ("C-c g g" . #'gptel)
	      ("C-c g s" . #'gptel-send)
	      ("C-c g a" . #'gptel-add)
	      ("C-c g m" . #'gptel-menu))
  :config
  (setq
   gptel-model 'gemini-2.5-flash
   gptel-backend (gptel-make-gemini "Gemini"
		   :key (lambda ()
			  (auth-source-pick-first-password
			   :host "api.generativelanguage.google.com"))
		   :stream t)))

(provide 'my-ai)
