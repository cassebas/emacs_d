;;; package --- Summary

;;; Commentary:

;;; Code:
(use-package php-mode
  :ensure t)

;; Show line numbers when editing php code.
(add-hook 'php-mode-hook (lambda () (line-number-mode 1)))

;; Also use web-mode
(use-package web-mode
  :ensure t)

;; Show line numbers when editing html code.
(add-hook 'web-mode-hook (lambda () (line-number-mode 1)))

(provide 'init-php)
;;; init-php.el ends here
