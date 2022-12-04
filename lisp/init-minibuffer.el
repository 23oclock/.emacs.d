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
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

;; show some describtional information in minibuffer
(use-package marginalia
  :config
  (marginalia-mode))

;; (use-package embark
;;   :bind
;;   (("C-." . embark-act)         ;; pick some comfortable binding
;;    ("C-;" . embark-dwim)        ;; good alternative: M-.
;;    ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
;;   :init
;;   ;; Optionally replace the key help with a completing-read interface
;;   (setq prefix-help-command #'embark-prefix-help-command)
;;   :config
;;   ;; Hide the mode line of the Embark live/completions buffers
;;   (add-to-list 'display-buffer-alist
;;                '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;;                  nil
;;                  (window-parameters (mode-line-format . none)))))
;; 
;; ;; Consult users will also want the embark-consult package.
;; (use-package embark-consult
;;   :ensure t ; only need to install it, embark loads it after consult if found
;;   :hook
;;   (embark-collect-mode . consult-preview-at-point-mode))


;; savehist
(use-package savehist
  :hook (after-init . savehist-mode)
  :init (setq enable-recursive-minibuffers t ; Allow commands in minibuffers
	      history-length 1000
	      savehist-additional-variables '(mark-ring
					      global-mark-ring
					      search-ring
					      regexp-search-ring
					      extended-command-history)
	      savehist-autosave-interval 300))

;;; ivy
;;  (use-package ivy
;;    :diminish ivy-mode
;;    :hook (after-init . ivy-mode)
;;    :config
;;    (use-package swiper)
;;    (setq ivy-use-virtual-buffers t
;;  	enable-recursive-minibuffers t
;;  	ivy-count-format "(%d/%d) ")
;;    :bind
;;    ("\C-s" . swiper))
;; 
;; ;;; prescient
;;  (use-package prescient
;;    :after (ivy)
;;    :config
;;    (use-package ivy-prescient)
;;    (use-package company-prescient)
;;    (ivy-prescient-mode 1)
;;    (company-prescient-mode 1)
;;    (setq prescient-save-file (expand-file-name ".cache/prescient" user-emacs-directory))
;;    (prescient-persist-mode t))

(provide 'init-minibuffer)
