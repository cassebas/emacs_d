;;; package --- Summary

;;; Commentary:

;;; Code:

;;;;; Do visual-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))

;;;;; And no auto-fill-mode in org-mode
(add-hook 'org-mode-hook (lambda () (auto-fill-mode -1)))

;;;;; But with word wrap, yeah.
(add-hook 'org-mode-hook (lambda () (setq-default word-wrap 1)))

;;;;; Turn on line numbers in org-mode
(add-hook 'org-mode-hook (lambda () (line-number-mode 1)))

;;;;; Enable spell checking for editing org files.
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode 1)))

;;; Another org-mode exporter via pandoc
(use-package ox-pandoc
  :ensure t)

(customize-set-value 'org-latex-with-hyperref nil)

(provide 'init-org)
;;; init-org.el ends here
