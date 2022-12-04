(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
;; (setq package-load-list '((use-package)))
(package-initialize)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t
      ;; use-package-always-defer t
      use-package-enable-imenu-support t
      ;; use-package-verbose t
      use-package-expand-minimally t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq default-directory "c:/Users/chuan/")

(require 'init-ui)
(require 'init-emacs)
(require 'init-minibuffer)
(require 'init-org)
(require 'init-project)
(require 'init-pyim)
(require 'init-editor)
(require 'init-latex)
(require 'init-proxy)  ;; 设置代理，需要进去文件修改一下代理链接。
