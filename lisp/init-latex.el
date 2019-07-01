;;; package --- Summary

;;; Commentary:

;;; Code:

(load "auctex.el" nil t t)

;; These are for auctex
(add-hook 'LaTeX-mode-hook (lambda () (setq TeX-auto-save t)))
(add-hook 'LaTeX-mode-hook (lambda () (setq TeX-parse-self t)))

;; Some basic settings
(add-hook 'LaTeX-mode-hook (lambda () (linum-mode t)))
(add-hook 'LaTeX-mode-hook (lambda () (auto-fill-mode nil)))
(add-hook 'LaTeX-mode-hook (lambda () (setq-default word-wrap t)))
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode t)))

(provide 'init-latex)
;;; init-latex.el ends here

