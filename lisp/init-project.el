;;; magit
(use-package magit
  :defer t
  :bind ("C-x g" . magit))

;;; projectile
(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-project-search-path '(("~/projects/" . 1)))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(provide 'init-project)
