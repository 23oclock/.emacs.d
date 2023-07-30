;; -*- lexical-binding: t -*-

(use-package doom-themes
  :config
  (defun light-theme()
    (interactive)
    (load-theme 'doom-one-light t))
  (defun dark-theme()
    (interactive)
    (load-theme 'doom-one t))
  ;; 根据时间设置主题颜色
  (defun set-theme-by-time()
    (setq now (string-to-number (substring (current-time-string) 11 13)))
    (if (or (member now (number-sequence 20 24)) (member now (number-sequence 0 6)))
	(dark-theme)
      (light-theme)))
  (set-theme-by-time))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(provide 'init-ui)
