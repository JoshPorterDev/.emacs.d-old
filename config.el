(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq inhibit-startup-message t)            ; Disable startup message
(setq auto-save-default nil)                ; Disable autosaves
(setq backup-inhibited t)                   ; Disable backups
(tool-bar-mode -1)                          ; Disable tool bar
(menu-bar-mode -1)                          ; Disable menu bar
(scroll-bar-mode -1)                        ; Disable scroll bar
(setq ring-bell-function 'ignore)           ; Disable bell

(setq scroll-step 1)
(setq scroll-conservatively 101)
(setq fast-but-imprecise-scrolling nil)
(setq jit-lock-defer-time 0)

(use-package mwheel
  :ensure nil
  :config
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil))

(add-to-list 'default-frame-alist
	     '(font . "JetBrainsMono NF-10"))

(use-package doom-themes
  :config
  (load-theme 'doom-tokyo-night t))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; Show time and battery information on modeline
(display-time-mode 1)
(display-battery-mode 1)

(set-frame-parameter (selected-frame) 'alpha '(98 . 98))
(add-to-list 'default-frame-alist '(alpha . (98 . 98)))

(use-package display-line-numbers
  :ensure nil
  :hook (prog-mode . display-line-numbers-mode)
  :config
  (setq-default display-line-numbers-width 3))

(use-package all-the-icons)

(use-package neotree
  :config
  (setq neo-theme 'icons))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-banner-logo-title "Josh's Emacs"))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

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

(use-package counsel
             :bind(("M-x" . counsel-M-x)
                   ("C-x b" . counsel-ibuffer)
                   ("C-x C-f" . counsel-find-file)
		   ("C-M-j" . counsel-switch-buffer)
                   :map minibuffer-local-map
                   ("C-r" . counsel-minibuffer-history))
             :config
             (setq ivy-initial-inputs-alist nil))

(use-package which-key
  :init
    (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	  which-key-sort-order #'which-key-key-order-alpha
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-side-window-max-height 0.25
	  which-key-idle-delay 0.8
	  which-key-max-description-length 25
	  which-key-allow-imprecise-window-fit t
	  which-key-separator " → " ))

(use-package magit)

(use-package gcmh
  :demand t
  :config
  (setq gcmh-low-cons-threshold (* 16 1024 1024))
  (gcmh-mode +1))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/dev")
    (setq projecttile-project-search-path '("~/dev")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package general
  :config
  (general-evil-setup)

  (general-create-definer josh/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (josh/leader-keys
    "e" '(neotree-toggle :wk "neotree-toggle")
    "tt" '(counsel-load-theme :wk "switch theme")
    "cc" '(comment-or-uncomment-region :wk "comment line")))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))
