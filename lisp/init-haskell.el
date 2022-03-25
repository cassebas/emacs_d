(use-package haskell-mode
  :ensure t)

(add-hook 'haskell-mode-hook (lambda () (linum-mode 1)))

(bind-key* "C-c C-c" #'comment-region)

(provide 'init-haskell)
