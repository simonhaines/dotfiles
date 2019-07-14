;;; work-in-progress
;;; c.f.
;;; http://tuhdo.github.io/c-ide.html
;;; https://nilsdeppe.com/posts/emacs-c++-ide2
;;; https://gist.github.com/nilsdeppe/7645c096d93b005458d97d6874a91ea9

;;; General settings

;; No splash
(inhibit-startup-screen t)
;; No toolbar
(tool-bar-mode nil)
;; No menu bar
(menu-bar-mode nil)
;; No blinking cursor
(blink-cursor-mode nil)
;; No backup files
(setq make-backup-files nil)
;; Turn off autosave
(setq auto-save-default nil)
;; Don't ring the bell
(setq ring-bell-function 'ignore)
;; Show column numbers
(setq column-number-mode t)
;; Searching (these variables are buffer-local when set)
(setq-default case-fold-search t   ; case-insensitive
			  search-highlight t)  ; highlight matches
;; Highlight current line
(global-hl-line-mode t)
;; Match parentheses
(show-paren-mode t)
;; Overwrite selected regions
(delete-selection-mode t)
;; Draw the cursor as wide as the glyph (e.g. TAB)
(setq x-stretch-cursor t)
;; Y or n is good enough
(defalias 'yes-or-no-p 'y-or-n-p)
;; CUA mode (C-x, C-c, C-v cut copy paste and more)
;(cua-mode t)

;;; Key bindings

;; Undo
(global-set-key (kbd "C-/") 'undo)
;; Comment or uncomment region
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
;; Find file in project
(global-set-key (kbd "C-x M-f") 'project-find-file)


;; Package management
(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.org/packages/") t)




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
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
	("54f2d1fcc9bcadedd50398697618f7c34aceb9966a6cbaa99829eb64c0c1f3ca" "d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" default)))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
	(company zenburn-theme wc-mode rust-mode rust-playground cargo racer qml-mode qt-pro-mode racket-mode rainbow-delimiters helm)))
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
;;(when (eq system-type 'gnu/linux)
;;  (progn
;;	(add-to-list 'default-frame-alist '(height . 40))
;;	(set-face-font 'default "Inconsolata-10")))

;; Windows
(when (eq system-type 'windows-nt)
  (progn
	(set-face-font 'default "Inconsolata-12")
	(setq ring-bell-function 'ignore)
	(add-to-list 'default-frame-alist '(height . 35))
	(add-to-list 'default-frame-alist '(top . 50))
	(add-to-list 'default-frame-alist '(left . 50))))

;; Magit
(setq vc-follow-symlinks t) ; Don't ask, follow symlinks
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

;; Org mode
(with-eval-after-load 'org
  (setq org-startup-indented t)
  (add-hook 'org-mode-hook #'visual-line-mode))

;; Theme
(with-eval-after-load "zenburn-theme"
  (zenburn-with-color-variables
    (custom-theme-set-faces
     'zenburn
     ;; original `(default ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
     `(default ((t (:foreground ,zenburn-fg :background ,zenburn-bg-2)))))))
	 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "CYRE" :slant normal :weight normal :height 128 :width normal)))))

;; Highlight some keywords in prog-mode
(add-hook 'prog-mode-hook
          (lambda ()
            ;; Highlighting in cmake-mode this way interferes with
            ;; cmake-font-lock, which is something I don't yet understand.
            (when (not (derived-mode-p 'cmake-mode))
              (font-lock-add-keywords
               nil
               '(("\\<\\(FIXME\\|TODO\\|BUG\\|DONE\\)"
                  1 font-lock-warning-face t))))))
