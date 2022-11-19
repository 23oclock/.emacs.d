(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;;; font
(set-frame-font "等距更纱黑体 SC 16")
;;; xxxxxxxx
;;; 你你你你
(prefer-coding-system 'utf-8)

;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)
;; (setq use-package-verbose t)

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


;;; company
(use-package company
  :defer 5
  :config
  (global-company-mode 1))

;;; evil
(use-package evil
  :defer 0.5
  :config
  (evil-mode)
  (define-key evil-normal-state-map (kbd "<tab>") 'org-cycle))

;;; ivy
(use-package ivy
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :config
  (use-package swiper)
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	ivy-count-format "(%d/%d) ")
  :bind
  ("\C-s" . swiper))

;;; prescient
(use-package prescient
  :after (ivy)
  :config
  (use-package ivy-prescient)
  (use-package company-prescient)
  (ivy-prescient-mode 1)
  (company-prescient-mode 1)
  (setq prescient-save-file (expand-file-name ".cache/prescient" user-emacs-directory))
  (prescient-persist-mode t))

;;; doom theme
(use-package doom-themes
  :config
  (load-theme 'doom-tomorrow-day t))
(defun white-theme()
  (interactive)
  (load-theme 'doom-tomorrow-day t))
(defun black-theme()
  (interactive)
  (load-theme 'doom-tomorrow-night t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon t
	doom-modeline-height 1
	doom-modeline-minor-modes nil))

;;; org mode
(setq org-directory "~/org/")
(setq org-startup-indented t)
(setq org-adapt-indentation t)
(setq org-startup-folded 'content);; 只显示标题
(setq org-cycle-include-plain-lists 'integrate) ;; 将列表视为heading

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-special-todo-items t))

;;; insert heading with date
(defun get-format-date ()
  (format-time-string "%Y-%m-%d"))
(defun insert-heading-with-date()
  (interactive)
  (org-insert-heading)
  (insert (concat (get-format-date) "\n")))

;;; pyim
(use-package pyim
  :config
  (use-package pyim-basedict
    :after pyim
    :config
    (pyim-basedict-enable))
  (use-package posframe
    :after pyim)
  (setq default-input-method "pyim"
	pyim-page-length 5
	pyim-cloudim 'baidu
	pyim-indicator-list '(pyim-indicator-with-cursor-color pyim-indicator-with-modeline)
	pyim-page-tooltip '(posframe popup minibuffer))
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  ;; pyim-probe-program-mode
                  pyim-probe-org-structure-template))
  
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  (pyim-default-scheme 'microsoft-shuangpin)
  :bind
  ("C-\\" . toggle-input-method)
  ("M-j" . pyim-convert-string-at-point))

;;; magit
(use-package magit
  :defer t
  :bind ("C-x g" . magit))

;;; which key
(use-package which-key
  :config
  (which-key-mode))

;;; projectile
(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-project-search-path '(("~/projects/" . 1)))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(use-package counsel-projectile
  :after (projectile)
  :init (counsel-projectile-mode))

;;; lsp mode
;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;; 	 (python-mode . lsp-deferred)
;;          ;; if you want which-key integration
;; 	 (lsp-mode . lsp-enable-which-key-integration))
;;   :config
;;   (flymake-mode 0)
;;   :commands lsp-deferred)
;; 
;; (use-package lsp-ui
;;   :after lsp-mode
;;   :commands lsp-ui-mode
;;   :config
;;   (setq lsp-ui-doc--buffer-prefix "*lsp-ui-doc-"
;;         lsp-ui-doc-winum-ignore t
;;         ;; https://github.com/emacs-lsp/lsp-mode/blob/master/docs/tutorials/how-to-turn-off.md
;;         lsp-enable-symbol-highlighting t
;; 
;;         lsp-ui-doc-enable t
;;         lsp-ui-doc-position 'top
;;         lsp-ui-doc-alignment 'frame
;;         lsp-ui-doc-show-with-cursor t
;;         lsp-ui-doc-text-scale-level -3
;; 
;;         lsp-lens-enable t
;; 
;;         lsp-headerline-breadcrumb-enable nil
;; 
;;         lsp-ui-sideline-enable nil
;;         ;; lsp-ui-sideline-show-hover nil
;;         ;; lsp-ui-sideline-show-code-actions t
;;         ;; lsp-ui-sideline-show-diagnostics t
;;         lsp-ui-sideline-show-code-actions nil
;; 
;;         lsp-modeline-code-actions-enable t
;; 
;;         lsp-signature-render-documentation nil
;; 	scroll-margin 0)
;;   :bind (:map evil-normal-state-map
;;               ("gd" . lsp-ui-peek-find-definitions)
;;               ("gr" . lsp-ui-peek-find-references)
;;               :map md/leader-map
;;               ("Ni" . lsp-ui-imenu)))

;;; python env
(use-package conda
  :defer t
  :config
  ;; if you want interactive shell support, include:
  (conda-env-initialize-interactive-shells)
  ;; if you want eshell support, include:
  (conda-env-initialize-eshell)
  ;; if you want auto-activation (see below for details), include:
  (conda-env-autoactivate-mode t)
  ;; if you want to automatically activate a conda environment on the opening of a file:
  :hook
  (find-file . (lambda () (when (bound-and-true-p conda-project-env-path)
                                       (conda-env-activate-for-buffer)))))
