;;; package --- Summary

;;; Commentary:

;;; Code:

;; Get keybindings from evil-org-mode
;;   see https://github.com/Somelauw/evil-org-mode
;;
;; Set org-special-ctrl-a/e to t to make org-beginning-of-line and
;; org-end-of-line ignore leading stars or tags on headings. Repeat to
;; toggle. By default it’s set to nil.
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

;;;;; No auto-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (auto-fill-mode nil)))
;;;;; Do visual-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;;;;; And no auto-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (auto-fill-mode -1)))

;;;;; But with word wrap, yeah.
(add-hook 'org-mode-hook (lambda () (setq-default word-wrap 1)))

;;;;; Turn on line numbers in org-mode
(add-hook 'org-mode-hook (lambda () (linum-mode 1)))

;;;;; Enable spell checking for editing org files.
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode 1)))

;;; Another org-mode exporter via pandoc
(use-package ox-pandoc
  :ensure t)

(provide 'init-org)
;;; init-org.el ends here
