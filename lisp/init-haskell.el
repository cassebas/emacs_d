(use-package haskell-mode
  :ensure t)

(add-hook 'haskell-mode-hook (lambda () (line-number-mode 1)))

(bind-key* "C-c C-c" #'comment-region)

(provide 'init-haskell)
