;;; font
(set-frame-font "等距更纱黑体 SC 12")
;;; xxxxxxxx
;;; 你你你你

;;; doom theme
(use-package doom-themes
  :config
  (load-theme 'doom-tomorrow-day t))
(defun white-theme()
  (interactive)
  (load-theme 'doom-tomorrow-day t))
(defun black-theme()
  (interactive)
  (load-theme 'doom-tomorrow-night t))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon t
	doom-modeline-height 1
	doom-modeline-minor-modes nil))

(provide 'init-ui)
