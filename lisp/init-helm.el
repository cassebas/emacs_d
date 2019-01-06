;;; package --- Summary

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm for completion and selections ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Commentary:

;;; Code:
(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package helm
  :ensure t
  :config
  (progn
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-unset-key (kbd "C-x c"))
    (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
    (global-set-key (kbd "C-c h o") 'helm-occur)
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z")  'helm-select-action)
    
    ; rebind tab to run persistent action
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

    ; open helm buffer inside current window, not occupy whole other window
    (setq helm-split-window-in-side-p t)

    ; move to end or beginning of source when reaching top or bottom of source.
    (setq helm-move-to-line-cycle-in-source t)

    ; search for library in `require' and `declare-function' sexp.
    (setq helm-ff-search-library-in-sexp t)

    ; scroll 8 lines other window using M-<next>/M-<prior>
    (setq helm-scroll-amount 8)

    (setq helm-ff-file-name-history-use-recentf t)
    ))

(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (progn
    (projectile-global-mode)
    (setq projectile-completion-system 'helm)
    )
  )

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(provide 'init-helm)
;;; init-helm.el ends here
