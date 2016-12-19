(install-package 'haskell-mode)

(add-hook 'haskell-mode-hook (lambda () (linum-mode 1)))

(provide 'init-haskell)
