;; App settings
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)
(electric-pair-mode t)
(setq auto-save-default nil)
(setq make-backup-files nil)

;; C stuff
(setq c-default-style "bsd")
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)

;; Install packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(tree-sitter tree-sitter-langs company yasnippet catppuccin-theme rust-mode)
  "Packages to install.")
  
(defun my-install-packages ()
  "Install missing packages."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))
      
(my-install-packages)

;; Tree-sitter
(require 'tree-sitter)
(require 'tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Company
(global-company-mode)
(setq company-idle-delay 0.0)

;; Catppuccin theme
(load-theme 'catppuccin t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eglot-ignored-server-capabilities '(:documentOnTypeFormattingProvider :inlayHintProvider))
 '(inhibit-startup-screen t)
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "CommitMono Nerd Font" :foundry "    " :slant normal :weight regular :height 120 :width normal)))))
