

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(package-selected-packages (quote (racket-mode rainbow-delimiters helm)))
 '(standard-indent 4)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell t))

;; Racket
(add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)
(add-hook 'racket-mode-hook 'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook 'show-paren-mode)
(setq show-paren-delay 0)

;; Linux
(when (eq system-type 'gnu/linux)
  (progn
	(add-to-list 'default-frame-alist '(height . 40))
	(set-face-font 'default "Inconsolata-10")))

;; Windows
(when (eq system-type 'windows-nt)
  (progn
	(set-face-font 'default "Inconsolata-12")
	(setq ring-bell-function 'ignore)
	(add-to-list 'default-frame-alist '(height . 35))
	(add-to-list 'default-frame-alist '(top . 50))
	(add-to-list 'default-frame-alist '(left . 50))))

;; package management
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
	
;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; Helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(setq helm-split-window-in-side-p		t
	  helm-move-to-line-cycle-in-source	t
	  helm-ff-search-library-in-sexp	t
	  helm-scroll-amount				8
	  helm-ff-file-name-history-use-recentf	t
	  helm-echo-input-in-header-line		t)
(setq helm-autoresize-max-height	0)
(setq helm-autoresize-min-height	20)
(helm-autoresize-mode 1)
(helm-mode 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
