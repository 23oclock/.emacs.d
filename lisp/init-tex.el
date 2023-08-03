;; -*- lexical-binding: t -*-

(use-package cdlatex
  :after tex
  :hook
  ((org-mode . turn-on-org-cdlatex)
   (LaTeX-mode . turn-on-cdlatex)))

(use-package tex
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (add-hook 'LaTeX-mode-hook (lambda()
			       ;;;;LaTeX模式下，不打开自动折行
			       ;;(turn-off-auto-fill)
			       ;;;;显示行数
			       ;;(linum-mode 1)
			       ;;;;打开自动补全
			       ;;(auto-complete-mode 1)
			       ;;;;启动mathmode，你也可以不用
			       ;;(LaTeX-math-mode 1)
			       ;;;;打开outlinemode
			       ;;(outline-minor-mode 1)
			       ;;;;接下来是和编译TeX有关的
			       ;;;;编译的时候，不在当前窗口中显示编译信息
			       ;;(setq TeX-show-compilation nil)
			       ;;(setq TeX-clean-confirm nil)
			       ;;(setq TeX-save-query nil)
			       ;;;;按\后光标跳到mini-buffer里面输入命令
			       ;;;;看个人习惯，因为如果有了auto-complete和yasnippet
			       ;;;;这个不开启也问题不大。
			       ;;(setq TeX-electric-escape t)
			       ;;;;重新定义pdfviewer，我设定为了evince。
			       ;;;; (setq TeX-view-program-list '(("Evince" "evince %o")))
			       ;;;; (setq TeX-view-program-selection '((output-pdf "Evince")))
			       ;;设置编译引擎为 XeTeX
			       (setq TeX-global-PDF-mode t TeX-engine 'xetex)
			       ;;使用XeLaTeX作为默认程序来编译LaTeX
			       (add-to-list 'TeX-command-list '("XeLaTeX" "%'xelatex%(mode)%' %t"TeX-run-TeX nil t))
			       (setq TeX-command-default "XeLaTeX")
			       )))


(provide 'init-tex)
