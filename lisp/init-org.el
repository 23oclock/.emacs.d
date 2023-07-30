;; -*- lexical-binding: t -*-

(use-package org
  :init
  (setq org-directory "~/org/"
	org-startup-indented t
	org-startup-folded t)
  (setq org-return-follows-link t)
  )

(use-package org-modern
  :hook (org-mode . org-modern-mode))

(use-package org-roam
  :config
  (setq org-roam-directory (concat org-directory "org-roam"))
  (org-roam-db-autosync-mode)
  )

(use-package org-roam-ui
   :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


(provide 'init-org)
