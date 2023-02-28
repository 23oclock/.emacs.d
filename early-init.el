;;; -*- lexical-binding: t -*-

;;; 启动时调大垃圾回收阈值
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 256 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(setq initial-frame-alist '((fullscreen . maximized)))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq frame-inhibit-implied-resize t)

;; Disable GUI elements
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-splash-screen t)
(setq use-file-dialog nil)
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq ring-bell-function 'ignore)

(setq initial-buffer-choice "~/org")
