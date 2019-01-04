;;; package --- summary

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; evil for vim key-bindings  ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:

;;; Code:

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (progn
    ;;; i like evil but I do want my C-e back!
    (define-key evil-normal-state-map (kbd "C-e") 'end-of-visual-line)
    (define-key evil-motion-state-map (kbd "C-e") 'end-of-visual-line)
    ;;; make movement keys work like they should while using visual-line-mode
    (define-key evil-normal-state-map
      (kbd "<remap> <evil-beginning-of-line>") 'evil-beginning-of-visual-line)
    (define-key evil-normal-state-map
      (kbd "<remap> <evil-end-of-line>") 'evil-end-of-visual-line)
    (define-key evil-normal-state-map
      (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map
      (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map
      (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map
      (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    ;;; make horizontal movement cross lines
    (setq-default evil-cross-lines t)

    ;;; unset the M-. keybinding as I want it for rtags completion
    (define-key evil-normal-state-map (kbd "M-.") nil)

    ;;; prevent blinking of docview mode that is caused by evil
    (evil-set-initial-state 'doc-view-mode 'emacs)
    (add-hook 'doc-view-mode-hook
              (lambda ()
                (set (make-local-variable 'evil-emacs-state-cursor) (list nil)))
    (evil-mode t))))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package ace-window
  :ensure t)

(use-package evil-leader
  :after evil
  :ensure t
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "SPC" 'ace-window
      "f" 'helm-find-files
      "b" 'switch-to-buffer
      "g" 'magit-status
      "k" 'kill-buffer
      "s" 'helm-ag
      "p" 'projectile-find-file
      "m" 'mu4e
      "x" 'helm-M-x)))

;; ;;; prevent q from being bound to record macro in view mode, examples are:
;; ;;;   - raw message view in mu4e
;; ;;;   - compilation error window in haskell-mode (doesn't work)
;; (add-hook 'view-mode-hook 'evil-motion-state)
;; ;(add-hook 'haskell-error-mode 'evil-motion-state)

(provide 'init-evil)
;;; init-evil ends here
