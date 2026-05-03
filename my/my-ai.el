(use-package gptel
  :ensure t
  :config
  (setq
   gptel-model 'gemini-2.5-flash
   gptel-backend (gptel-make-gemini "Gemini"
		   :key (lambda ()
			  (auth-source-pick-first-password
			   :host "api.generativelanguage.google.com"))
		   :stream t)))


(provide 'my-ai)
