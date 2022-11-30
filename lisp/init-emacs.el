;;; coding system
(prefer-coding-system 'utf-8)

;;; config file settings
(global-set-key (kbd "<f5>") 'eval-buffer)
(global-set-key (kbd "<f1>") (lambda() (interactive) (find-file (concat user-emacs-directory "init.el"))))
;; emacs 自动生成的文件放到一个目录中
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))
;; 简写 yes 和 no
(fset 'yes-or-no-p 'y-or-n-p)
;; 备份文件集中到一个目录
(setq backup-dir (concat user-emacs-directory "backup"))
(setq backup-directory-alist `(("." . ,backup-dir)))  ;; 此处反引号和逗号配合使用，表示求出变量的值

(provide 'init-emacs)
