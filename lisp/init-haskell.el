(use-package haskell-mode
  :ensure t)

;; (use-package hindent
;; 	     :ensure t)

(add-hook 'haskell-mode-hook (lambda () (linum-mode 1)))

(add-hook 'haskell-mode-hook
 (lambda ()
  (set (make-local-variable 'company-backends)
	(append '((company-capf company-dabbrev-code))
	 company-backends))))

;; (install-package 'ghc)
;; (install-package 'company-ghc)
;; (install-package 'shm)

;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)

;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)
;; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;(add-hook 'hashell-mode-hook 'company-mode)
;(add-to-list 'company-backends 'company-ghc)

;; (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
;;   (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
;;   (add-to-list 'exec-path my-cabal-path))
;; 
;; (custom-set-variables
;;  '(haskell-process-suggest-remove-import-lines t)
;;  '(haskell-process-auto-import-loaded-modules t)
;;  ;; '(company-ghc-show-info t)
;;  ;; Use integrated REPL capabilities of cabal instead of ghci
;;  '(haskell-process-type 'cabal-repl)
;;  '(haskell-tags-on-save t)
;;  ;; If using Stack as build tool, we could also do:
;;  ;;   (custom-set-variables '(haskell-process-type 'stack-ghci))
;;  '(haskell-process-log t)
;;  ;; prevent evil-normal state in HS-error window, with
;;  ;; annoying "q" define kbd macro..
;;  ;; -> don't know how to disable it otherwise :(
;;  '(haskell-interactive-popup-errors nil))
;; 
;; (eval-after-load 'haskell-mode
;;   '(progn
;;      (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;;      (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;      (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
;;      (define-key haskell-mode-map (kbd "C-c c-n C-i") 'haskell-process-do-info)
;;      (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
;;      (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
;; 
;; ;; Evil: here you must not annoy me with your 'record kbd macro' when pressing q
;; ;;   unfortunately this doesn't work, let's set interactive errors to nil (above)
;; ;; (eval-after-load 'haskell-error-mode
;; ;;   '(progn
;; ;;      (define-key evil-normal-state-map "q" 'quit-window)))
;; 
;; (eval-after-load 'haskell-cabal
;;   '(progn
;;      (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;      (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;      (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;      (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(provide 'init-haskell)
