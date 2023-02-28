;;; -*- lexical-binding: t -*-

(use-package cdlatex
  :hook (LaTeX-mode . cdlatex-mode)
  :hook (org-mode . org-cdlatex-mode)
  :config
  (define-key cdlatex-mode-map  "(" nil)
  (setq cdlatex-command-alist
	'(("al" "Insert an ALIGNED environment template" "" cdlatex-environment ("aligned") t t)))
)

(use-package tex
  :after cdlatex
  :ensure auctex)

(provide 'init-tex)
