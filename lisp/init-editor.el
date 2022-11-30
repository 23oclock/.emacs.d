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

(provide 'init-editor)
