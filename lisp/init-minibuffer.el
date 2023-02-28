;;; -*- lexical-binding: t -*-

;;; which key
(use-package which-key
  :config
  (which-key-mode))

;; fast search
(use-package consult
  :bind
  ("C-s" . consult-line)
  ("C-x C-a" . consult-ripgrep))

;; vertically show minibuffer
(use-package vertico
  :config
  (vertico-mode t))
 
;; search orderless in minibuffer
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

;; show some describtional information in minibuffer
(use-package marginalia
  :config
  (marginalia-mode))

(use-package prescient)
(use-package corfu-prescient)
(use-package vertico-prescient)

(provide 'init-minibuffer)
