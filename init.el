;;; -*- lexical-binding: t -*-

;;; 自定义字体：等距更纱黑体中文字宽刚好是英文字母的两倍
;;; xxxxxxxx
;;; 你你你你
(set-frame-font "等距更纱黑体 SC 16")

;;; 设置melpa镜像
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)  ;; 总是安装 use-package 中的包
;; (setq use-package-always-defer t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))  ;; 载入 .emacs.d/lisp/ 文件夹中的代码

(require 'init-emacs)
(require 'init-edit)
(require 'init-company)
(require 'init-minibuffer)
(require 'init-ui)
(require 'init-org)
(require 'init-tex)
