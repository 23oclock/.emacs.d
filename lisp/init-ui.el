;;; font
(set-frame-font "等距更纱黑体 SC 12")
;;; xxxxxxxx
;;; 你你你你

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

;; ;;; dashboard
;; (use-package dashboard
;;   :config
;;   (dashboard-setup-startup-hook)
;;   (setq dashboard-items '((recents  . 5)
;;                         (projects . 5)))
;;   (setq dashboard-center-content t
;; 	dashboard-startup-banner 2
;; 	dashboard-set-init-info nil
;; 	dashboard-set-footer nil
;; 	dashboard-set-heading-icons t
;; 	dashboard-set-navigator t
;; 	dashboard-show-shortcuts nil
;; 	;; dashboard-set-file-icons t
;; 	dashboard-banner-logo-title "Make it better"))

;; all the icons
(use-package all-the-icons)

(provide 'init-ui)
