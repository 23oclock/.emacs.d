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
  (setq org-superstar-special-todo-items t)
  (setq org-superstar-headline-bullets-list
      '("◉" ("🞛" ?◈) "○" "▷")))

;;; insert heading with date
(defun get-format-date ()
  (format-time-string "%Y-%m-%d"))
(defun insert-heading-with-date()
  (interactive)
  (org-insert-heading)
  (insert (concat (get-format-date) "\n")))

(provide 'init-org)
