;; General options
(setq inhibit-startup-message t)            ; Disable startup message
(setq auto-save-default nil)                ; Disable autosaves
(setq backup-inhibited t)                   ; Disable backups
(tool-bar-mode -1)                          ; Disable tool bar
(menu-bar-mode -1)                          ; Disable menu bar
(scroll-bar-mode -1)                        ; Disable scroll bar
(setq ring-bell-function 'ignore)           ; Disable bell
(global-display-line-numbers-mode)          ; Line numbers
(setq display-line-numbers-width-start 1)   ; Fixed width for line number column

;; Set transparent background
(set-frame-parameter (selected-frame) 'alpha '(98 . 98))
(add-to-list 'default-frame-alist '(alpha . (98 . 98)))

;; Better scrolling
(setq scroll-step 1)
(setq scroll-conservatively 101)

;; MELPA package archive
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Use-package utility
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Doom themes
(use-package doom-themes
  :config
  (load-theme 'doom-tokyo-night t))

;; Doom status line
(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; Evil
(use-package evil)
(require 'evil)
(evil-mode 1)

;; Counsel
(use-package counsel
             :bind(("M-x" . counsel-M-x)
                   ("C-x b" . counsel-ibuffer)
                   ("C-x C-f" . counsel-find-file)
                   :map minibuffer-local-map
                   ("C-r" . counsel-minibuffer-history))
             :config
             (setq ivy-initial-inputs-alist nil))

;; Ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
