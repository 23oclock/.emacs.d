;; -*- lexical-binding: t -*-

(use-package vertico
  :config
  (vertico-mode t))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package corfu
   :init
   (global-corfu-mode)
   :custom
   (corfu-auto t))

(use-package consult
  :bind
  ("C-s" . consult-line)
  ("C-x C-a" . consult-ripgrep))

(use-package marginalia
  :config
  (marginalia-mode))

(use-package prescient)
(use-package corfu-prescient)
(use-package vertico-prescient)

(use-package which-key
  :config
  (which-key-mode))

(provide 'init-minibuffer)
