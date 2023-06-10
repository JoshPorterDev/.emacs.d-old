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

;; Better scrolling
(setq scroll-step 1)
(setq scroll-conservatively 101)
