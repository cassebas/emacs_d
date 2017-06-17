(install-package 'haskell-mode)
(install-package 'hindent)
(install-package 'ghc)
(install-package 'company-ghc)
(install-package 'shm)

(add-hook 'haskell-mode-hook (lambda () (linum-mode 1)))
(add-hook 'haskell-mode-hook (lambda () (fci-mode 1)))
(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-hook 'hashell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(custom-set-variables '(haskell-tags-on-save t))

(provide 'init-haskell)
