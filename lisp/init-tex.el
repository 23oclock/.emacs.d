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

;; (use-package org-fragtog
;;   :hook
;;   (org-mode . org-fragtog-mode)
;;   :config
;;   (setq org-startup-with-latex-preview t)
;;   (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
;;   :custom
;;   (org-fragtog-preview-delay 1.0))

(use-package xenops
   :hook
   (org-mode . org-fragtog-mode))
  


(provide 'init-tex)
