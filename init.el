;; for load sub directory config
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

;; ;; load unpublished script dir
(add-subdirs-to-load-path "~/.emacs.d/scripts/")

;; load config(
(add-subdirs-to-load-path "~/.emacs.d/config/")

(require 'init-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(straight lsp-bridge magit autothemer material-ocean window-numbering helm-projectile projectile writeroom-mode company helm-tramp helm-ag helm-gtags lsp-ui web-mode helm-lsp rust-mode lsp-pyright py-autopep8 vue-mode doom-modeline nyan-mode doom-themes all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
