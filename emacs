

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
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(package-selected-packages (quote (rust-mode cider racket-mode)))
 '(standard-indent 4)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell t))

;; Linux
(when (eq system-type 'gnu/linux)
  (progn
	(add-to-list 'default-frame-alist '(height . 40))
	(set-face-font 'default "Deja Vu Sans Mono-10")))

;; Windows
(when (eq system-type 'windows-nt)
  (progn
	(set-face-font 'default "Consolas-11")))

;; package management
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
	
;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
