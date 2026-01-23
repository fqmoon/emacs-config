(use-package gptel
  :ensure t
  :config
  (gptel-make-openai "Moonshot"
    :host "api.moonshot.cn"    ;; (国内) 或 "api.moonshot.ai"（全球）
    :key #'gptel-api-key-from-auth-source
    :stream t
    :models '(;; 支持 128k 上下文的视觉模型，具备图片理解能力。使用 Kimi 智能助手最新版本，可能包含尚未稳定的特性
	      kimi-latest
	      ;; 生成模型moonshot-v1
	      moonshot-v1-8k
	      moonshot-v1-32k
	      moonshot-v1-128k
	      ;; kimi-v2模型
	      ;; 上下文长度 256k，在 0711 版本基础上增强了 Agentic Coding 能力、前端代码美观度和实用性、以及上下文理解能力
	      kimi-k2-0905-preview
	      ;; 上下文长度 128k，MoE 架构基础模型，总参数 1T，激活参数 32B。具备超强代码和 Agent 能力
	      kimi-k2-0711-preview
	      ;; K2 的高速版本，对标最新版本(0905)。输出速度提升至每秒 60-100 tokens，上下文长度 256k
	      kimi-k2-turbo-preview
	      ;; K2 长思考模型，支持 256k 上下文，支持多步工具调用与思考，擅长解决更复杂的问题
	      kimi-k2-thinking
	      ;; K2 长思考模型的高速版本，支持 256k 上下文，擅长深度推理，输出速度提升至每秒 60-100 tokens
	      kimi-k2-thinking-turbo))

  (setq gptel-backend (gptel-get-backend "Moonshot"))
  ;; 设置默认模型
  ;; kimi-k2-thinking是便宜的thinking模型，上下文也有256K，划算
  (setq gptel-model 'kimi-k2-thinking))


(provide 'my-ai)
