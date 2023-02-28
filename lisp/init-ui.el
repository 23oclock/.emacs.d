;;; -*- lexical-binding: t -*-

;;; doom theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

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
(set-theme-by-time)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon t
	doom-modeline-height 1
	doom-modeline-minor-modes nil))

;; all the icons
(use-package all-the-icons)

(provide 'init-ui)
