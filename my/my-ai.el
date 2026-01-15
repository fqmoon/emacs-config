(use-package gptel
  :ensure t
  :config
  (gptel-make-openai "Moonshot"
    :host "api.moonshot.cn"    ;; (国内) 或 "api.moonshot.ai"（全球）
    :key #'gptel-api-key-from-auth-source
    :stream t
    :models '(kimi-latest
	      moonshot-v1-8k
	      moonshot-v1-32k
	      moonshot-v1-128k
	      kimi-k2-0905-preview
	      kimi-k2-0711-preview
	      kimi-k2-turbo-preview
	      kimi-k2-thinking
	      kimi-k2-thinking-turbo))

  (setq gptel-backend (gptel-get-backend "Moonshot"))
  (setq gptel-model 'kimi-k2-0711-preview)   ;; 切换默认模型
  )


(provide 'my-ai)
