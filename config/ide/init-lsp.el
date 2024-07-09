(setq js-indent-level 2)

(use-package vue-mode :ensure t
  :config
  (setq web-mode-code-indent-offset 2))
(use-package csharp-mode :ensure t)
(use-package py-autopep8
  :hook
  (python-mode . py-autopep8-mode))
(use-package lsp-pyright
  :config
  (setq lsp-pyright-venv-path "/Users/binwan/opt/anaconda3/envs")
  (setq lsp-pyright-auto-import-completions t)
  (setq lsp-pyright-auto-search-paths t)
  :bind
  (("C-c j" . lsp-find-definition))
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))
(use-package rust-mode
  :config
  (setq rust-format-on-save t)
  (setq lsp-rust-server 'rust-analyzer)
  :bind (("C-c C-c" . rust-run)))

(use-package lsp-mode
  :init
  :hook ((vue-mode . lsp)
	 (csharp-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration)
	 (json-mode . lsp)
	 (rust-mode . lsp))
  ;; for typescript/javascript
  ;; (setq lsp-typescript-auto-closing-tags t)
  ;; (setq lsp-typescript-format-enable t)
  ;; (setq lsp-javascript-auto-closing-tags t)
  
  :commands lsp
  :bind (
	 ("C-c s s" . lsp-restart-workspace)
	 ("C-." . lsp-execute-code-action)
	 ("C-c C-j" . lsp-find-definition)
	 ("C-c C-r" . lsp-find-references)
	 ("C-c C-i" . lsp-find-implementation)
	 ("C-C t b" . pop-tag-mark)))

;; (use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; (use-package dap-mode)

(use-package web-mode
  :config
  (setq web-mode-code-indent-offset 4)
  (add-to-list 'auto-mode-alist '("\\.cshtml?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.razor?\\'" . web-mode)))



;; ; lsp
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (setq lsp-ui-mode nil)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-imenu-enable t)
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-ignore-duplicate t)
  )

(provide 'init-lsp)
