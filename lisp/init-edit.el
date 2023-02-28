;;; -*- lexical-binding: t -*-

;;; evil
(use-package evil
  :defer 0.5
  :config
  (evil-mode)
  (evil-set-undo-system 'undo-redo)
  (define-key evil-normal-state-map (kbd "<tab>") 'org-cycle))

;;; pyim
(use-package pyim
  :config
  (use-package pyim-basedict
    :after pyim
    :config
    (pyim-basedict-enable))
  (use-package posframe
    :after pyim)
  (setq default-input-method "pyim"
	pyim-page-length 5
	pyim-cloudim 'baidu
	pyim-indicator-list '(pyim-indicator-with-cursor-color pyim-indicator-with-modeline)
	pyim-page-tooltip '(posframe popup minibuffer))
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  ;; pyim-probe-program-mode
                  pyim-probe-org-structure-template))
  
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  (pyim-default-scheme 'microsoft-shuangpin)
  :bind
  ("C-\\" . toggle-input-method)
  ("M-j" . pyim-convert-string-at-point))

(provide 'init-edit)
