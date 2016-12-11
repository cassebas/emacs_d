(install-package 'ox-pandoc)

;;;;; Auto-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (auto-fill-mode 1)))

;;;;; Turn on line numbers in org-mode
(add-hook 'org-mode-hook (lambda () (linum-mode 1)))

(provide 'init-org)
