;;; org mode
(require 'org-tempo)
(use-package org
  :demand t
  :init
  (setq org-directory "~/org/"
      org-startup-indented t
      org-adapt-indentatio t
      org-startup-folde 'content ;; 只显示标题
      org-cycle-include-plain-lists 'integrate) ;; 将列表视为heading
  :config
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\n")))
  :bind
  ("C-c c" . org-capture))


(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-special-todo-items t)
  (setq org-superstar-headline-bullets-list
      '("◉" ("🞛" ?◈) "○" "▷")))

;;; insert heading with timstamp
(defun org-insert-timestamp-heading()
  (interactive)
  (org-insert-heading)
  (insert (concat (format-time-string "%H:%M") "\n")))

;;; ox-pandoc
(use-package ox-pandoc
  :after org)

(provide 'init-org)
