;;; -*- lexical-binding: t -*-

(use-package emacs
  :config
  (prefer-coding-system 'utf-8)
  (fset 'yes-or-no-p 'y-or-n-p)
  (global-visual-line-mode 1)
  (setq custom-file (concat user-emacs-directory "emacs-custom.el"))
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backup"))))  ;; 此处反引号和逗号配合使用，表示求出变量的值
  (setq word-wrap-by-category t) 
  :bind (("<f5>" . eval-buffer)
	 ("<f1>" . (lambda() (interactive) (find-file (concat user-emacs-directory "init.el"))))
	 ("<f2>" . (lambda() (interactive) (find-file "~/org")))
	 ("<f3>" . (lambda() (interactive) (find-file "~/.emacs.d/lisp")))
	 )
  )

(provide 'init-emacs)
