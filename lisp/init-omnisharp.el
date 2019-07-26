(require 'omnisharp)
(require-package 'highlight-indent-guides)

(if (eq system-type 'windows-nt)
    (setq omnisharp-server-executable-path "C:\\emacs_x64\\packages\\omnisharp-roslyn\\OmniSharp.exe"))
(if (eq system-type 'darwin)
    (setq omnisharp-server-executable-path "/usr/local/share/omnisharp-osx/run"))
(if (eq system-type 'gnu/linux)
    (setq omnisharp-server-executable-path "/usr/local/share/omnisharp-linux/run"))

(setq omnisharp-company-match-sort-by-flx-score t)
(setq omnisharp-company-match-type 'company-match-flex)

(defun my-csharp-mode-setup ()
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)
  (setq company-minimum-prefix-length 3)
  (setq company-echo-delay 0)
  (setq highlight-indent-guides-method 'character)
  (add-to-list 'company-backends #'company-omnisharp)
  (define-key omnisharp-mode-map (kbd "C-c C-j") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "C-c C-b") 'pop-tag-mark)
  (define-key omnisharp-mode-map (kbd "C-c C-c") 'omnisharp-helm-find-usages)
  (define-key omnisharp-mode-map (kbd "C-c s s") 'omnisharp-start-omnisharp-server)
  (define-key omnisharp-mode-map (kbd "C-c s r") 'omnisharp-reload-solution)
  (define-key omnisharp-mode-map (kbd "C-.") 'omnisharp-run-code-action-refactoring)
  (define-key omnisharp-mode-map (kbd "C-d n") 'dotnet-new)
  (define-key omnisharp-mode-map (kbd "C-d r") 'dotnet-run)
  (define-key omnisharp-mode-map (kbd "C-d b") 'dotnet-build)
  (define-key omnisharp-mode-map (kbd "C-d a p") 'dotnet-add-package)
  (define-key omnisharp-mode-map (kbd "C-d g c") 'dotnet-goto-csproj)
  (define-key omnisharp-mode-map (kbd "C-c i") #'omnisharp-find-implementations)
  (define-key omnisharp-mode-map (kbd "C-c f") #'omnisharp-code-format-entire-file)
  (omnisharp-mode)
  (flycheck-mode)
  (highlight-indent-guides-mode)
  (fci-mode)
  (company-mode))

(after-load 'company
  '(add-to-list 'company-backends #'company-omnisharp))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

(provide 'init-omnisharp)
