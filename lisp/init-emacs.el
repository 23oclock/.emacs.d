;; -*- lexical-binding: t -*-

(use-package emacs
  :config
  (prefer-coding-system 'utf-8)
  (fset 'yes-or-no-p 'y-or-n-p)
  (global-visual-line-mode 1)
  (set-frame-font "等距更纱黑体 SC 14")
  (savehist-mode 1)
  (setq default-directory "~/")
  (setq custom-file (concat user-emacs-directory "emacs-custom.el"))
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backup"))))  ;; 此处反引号和逗号配合使用，表示求出变量的值
  (setq word-wrap-by-category t)
  :bind
  (("<f1>" . (lambda() (interactive) (find-file (concat user-emacs-directory "init.el"))))
   ("<f2>" . (lambda() (interactive) (find-file org-directory)))
   ("<f3>" . (lambda() (interactive) (find-file (concat user-emacs-directory "lisp"))))
   ("<f5>" . eval-buffer)))

(provide 'init-emacs)
