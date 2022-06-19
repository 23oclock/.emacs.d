(setq package-archives '(
			 ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(package-initialize)

;; init file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f12>") 'open-init-file)

;; eval-buffer
(global-set-key (kbd "<f5>") 'eval-buffer)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; evil
(use-package evil
  :config
  (evil-mode))
(use-package undo-tree
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

;; company
(use-package company
  :config
  (global-company-mode t))

;; configure frame
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (set-frame-position (selected-frame) 10 10)
;; (set-frame-size (selected-frame) 80 28)
(set-frame-font "Sarasa Mono SC 14")
;; xxxxxxxxxxxxxxxx
;; 你你你你你你你你

;; ivy
(use-package counsel
  :config
  (ivy-mode 1))
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(use-package amx
  :ensure t
  :init (amx-mode))

;; ui setting
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))
;; (setq frame-title-format "%b")
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(global-hl-line-mode t)
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)
(tooltip-mode 0)
(setq visible-bell 0)
(visual-line-mode t)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-0") 'text-scale-adjust)

;; doom theme
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
  (setq doom-modeline-icon t)
  (setq doom-modeline-height 1)
  (set-face-attribute 'mode-line nil :height 100)
  (set-face-attribute 'mode-line-inactive nil :height 100))

;; pyim
(use-package pyim
  :config
  (setq default-input-method "pyim"))
(use-package pyim-basedict
  :config
  (pyim-basedict-enable))
(require 'pyim-cregexp-utils)

;; 如果使用 popup page tooltip, 就需要加载 popup 包。
(require 'popup nil t)
(setq pyim-page-tooltip 'popup)

;; 如果使用 pyim-dregcache dcache 后端，就需要加载 pyim-dregcache 包。
;; (require 'pyim-dregcache)
;; (setq pyim-dcache-backend 'pyim-dregcache)

;; 显示5个候选词。
(setq pyim-page-length 5)

;; 金手指设置，可以将光标处的编码，比如：拼音字符串，转换为中文。
(global-set-key (kbd "M-j") 'pyim-convert-string-at-point)

;; 按 "C-<return>" 将光标前的 regexp 转换为可以搜索中文的 regexp.
(define-key minibuffer-local-map (kbd "C-<return>") 'pyim-cregexp-convert-at-point)

;; 我使用全拼
(pyim-default-scheme 'microsoft-shuangpin)
;;(pyim-default-scheme 'quanpin)
;; (pyim-default-scheme 'wubi)
;; (pyim-default-scheme 'cangjie)

;; 我使用云拼音
(setq pyim-cloudim 'baidu)

;; pyim 探针设置
;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
;; 我自己使用的中英文动态切换规则是：
;; 1. 光标只有在注释里面时，才可以输入中文。
;; 2. 光标前是汉字字符时，才能输入中文。
;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
(setq-default pyim-english-input-switch-functions
              '(pyim-probe-dynamic-english
                pyim-probe-isearch-mode
                ;; pyim-probe-program-mode
                pyim-probe-org-structure-template))
(setq-default pyim-punctuation-half-width-function
              '(pyim-probe-punctuation-line-beginning
                pyim-probe-punctuation-after-punctuation))

;; 开启代码搜索中文功能（比如拼音，五笔码等）
(pyim-isearch-mode 1)

;; org mode
(setq org-directory "~/org/")
(setq org-startup-indented t)
(setq org-adapt-indentation t)
(setq org-startup-folded 'content);; 只显示标题
(setq org-cycle-include-plain-lists 'integrate) ;; 将列表视为heading
(define-key evil-normal-state-map (kbd "<tab>") 'org-cycle)

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-special-todo-items t))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/org/inbox.org")
(setq org-capture-templates
   '(("j" "Journal" entry
      (file+olp+datetree "journal.org")
      "* <%<%H:%M:%S>>\n %?")))

;; image from clipboard
(setq org-image-actual-width (/ (display-pixel-width) 8))
(setq default-image-directory "c:/Users/chuan/org/images")
(defun copy-image-from-clipboard()
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat default-image-directory
		  ;;(buffer-file-name)
		  "/image_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  ;;   (shell-command "snippingtool /clip")
  (shell-command (concat "powershell -command \"Add-Type -AssemblyName System.Windows.Forms;if ($([System.Windows.Forms.Clipboard]::ContainsImage())) {$image = [System.Windows.Forms.Clipboard]::GetImage();[System.Drawing.Bitmap]$image.Save('" filename "',[System.Drawing.Imaging.ImageFormat]::Png); Write-Output 'clipboard content saved as file'} else {Write-Output 'clipboard does not contain image data'}\""))
  (insert (concat "[[file:" filename "]]"))
  (org-display-inline-images))

;; (use-package org-download
;;   :custom
;;   (org-download-method 'directory)
;;   (org-download-image-dir "~/org/images")
;;   (org-download-screenshot-method "~/scoop/apps/irfanview/current/i_view64.exe /capture=4 /convert=\"%s\""))


;; tex
(use-package tex
  :ensure auctex
  :config
  (setq org-latex-compiler "xelatex")
  (setq-default TeX-engine 'xetex))
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "xeCJK" t ("xelatex")))
(use-package cdlatex
    :hook (LaTeX-mode . cdlatex-mode)
    :hook (org-mode . org-cdlatex-mode)
    :config (define-key cdlatex-mode-map  "(" nil))

;; org to docx
(defun org-export-docx ()
  (interactive)
  (let ((docx-file (concat (file-name-sans-extension (buffer-file-name)) ".docx"))
	(template-file "~/org/template.docx"))
    ;; (shell-command (format "pandoc %s -o %s --reference-doc=%s" (buffer-file-name) docx-file template-file))
    (shell-command (format "pandoc %s -o %s" (buffer-file-name) docx-file))
    (message "Convert finish: %s" docx-file)))

;; magit
(use-package magit
  :bind (("C-x g" . magit-status))) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice "~/org/journal.org")
 '(package-selected-packages
   '(cdlatex auctex org-download undo-tree org-superstar amx use-package evil doom-themes doom-modeline counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:extend t :background "blanched almond" :distant-foreground "black")))))
