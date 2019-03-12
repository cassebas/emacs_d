;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Special org-mode keybindings for when using evil (like me:)
(use-package evil-org
  :ensure t
  :after org
  :config
  (progn
	(setq-default org-special-ctrl-a/e t)
	(add-hook 'org-mode-hook 'evil-org-mode)
	(add-hook 'evil-org-mode-hook
			  (lambda ()
				(evil-org-set-key-theme
				 '(navigation insert textobjects additional)))))
  )

;;;;; Auto-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (auto-fill-mode 1)))

;;;;; Turn on line numbers in org-mode
(add-hook 'org-mode-hook (lambda () (linum-mode 1)))

;;; Another org-mode exporter via pandoc
(use-package ox-pandoc
  :ensure t)

(provide 'init-org)
;;; init-org.el ends here
