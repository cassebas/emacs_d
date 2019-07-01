;;; package --- Summary

;;; Commentary:

;;; Code:

(add-hook 'LaTeX-mode-hook (lambda () (linum-mode 1)))
(add-hook 'LaTeX-mode-hook (lambda () (auto-fill-mode 1)))
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode 1)))

(provide 'init-latex)
;;; init-latex.el ends here

