;;; package --- Summary

;;; Commentary:

;;; Code:

;; Install auctex
(use-package tex
  :straight auctex)


;; These are for auctex
(add-hook 'LaTeX-mode-hook (lambda () (setq TeX-auto-save t)))
(add-hook 'LaTeX-mode-hook (lambda () (setq TeX-parse-self t)))
(add-hook 'LaTeX-mode-hook (lambda () (setq-default TeX-master nil)))

;; Some basic settings

; For now turn off line numbers for latex
;; (add-hook 'LaTeX-mode-hook (lambda () (display-line-numbers-mode t)))
(add-hook 'LaTeX-mode-hook (lambda () (auto-fill-mode -1)))
(add-hook 'LaTeX-mode-hook (lambda () (setq-default word-wrap t)))
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode t)))

(provide 'init-latex)
;;; init-latex.el ends here

