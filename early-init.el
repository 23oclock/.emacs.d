;;; -*- lexical-binding: t -*-

(setq initial-frame-alist '((fullscreen . maximized)))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq frame-inhibit-implied-resize t)

;; disable gui elements
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-splash-screen t)
(setq use-file-dialog nil)
(global-hl-line-mode 1)
(menu-bar--display-line-numbers-mode-relative)
;; (global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)

(setq initial-buffer-choice "~/org")
