;; -*- lexical-binding: t -*-

(use-package evil
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo)
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "SPC") nil)
    (define-key evil-motion-state-map (kbd "RET") nil)
    (define-key evil-motion-state-map (kbd "TAB") nil))
  (define-key evil-normal-state-map (kbd "<tab>") 'org-cycle))

(use-package posframe)

(use-package pyim
  :config
  (use-package pyim-basedict
    :after pyim
    :config
    (pyim-basedict-enable))
  (setq default-input-method "pyim"
	pyim-page-length 5
	pyim-cloudim 'baidu
	pyim-indicator-list '(pyim-indicator-with-cursor-color pyim-indicator-with-modeline)
	pyim-page-tooltip '(posframe popup minibuffer))
  (pyim-default-scheme 'microsoft-shuangpin)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  ;; pyim-probe-program-mode
                  pyim-probe-org-structure-template))
  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))
  :bind
  ("C-\\" . toggle-input-method)
  ("M-j" . pyim-convert-string-at-point))

(provide 'init-edit)
