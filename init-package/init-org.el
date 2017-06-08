(install-package 'ox-pandoc)

;;;;; Auto-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (auto-fill-mode 1)))

;;;;; Turn on line numbers in org-mode
(add-hook 'org-mode-hook (lambda () (linum-mode 1)))

;;; Special org-mode keybindings for when using evil (like me:)
(install-package 'evil-org)
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional))

(provide 'init-org)
