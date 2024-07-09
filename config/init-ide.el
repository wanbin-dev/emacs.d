;; set default indent
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-copy-env "GO111MODULE")
  (exec-path-from-shell-copy-env "GOPROXY")
  (exec-path-from-shell-copy-env "GOPRIVATE"))

;; git
(use-package magit)

;;; code tips
;; company
(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 1)
  (setq company-echo-delay 0.1)
  :config (global-company-mode t)
  :bind (("C-c <tab>" . #'global-company-mode))
  :bind (:map company-active-map
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("C-n" . #'company-select-next)
	      ("C-p" . #'company-select-previous)))

(add-subdirs-to-load-path "~/.emacs.d/config/themes") ;; load ide directory
;; use lsp
(require 'init-lsp)
;; (use-package eglot
;;   :hook (prog-mode . eglot-ensure)
;;   :config
;;   (setq eglot-events-buffer-size 0)
;;   :bind (
;; 	 ("C-c s s" . eglot-reconnect)
;; 	 ("C-." . eglot-code-actions)
;; 	 ("C-c C-j" . xref-find-definitions)
;; 	 ("C-c C-r" . xref-find-references)
;; 	 ("C-c C-i" . eglot-find-implementation)
;; 	 ("C-C t b" . pop-tag-mark)))

(provide 'init-ide)
