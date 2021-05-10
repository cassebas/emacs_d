;;; package --- Summary

;;; Commentary:

;;; Code:
(use-package php-mode
  :ensure t)

;; Show line numbers when editing python code.
(add-hook 'php-mode-hook (lambda () (linum-mode 1)))

;; Also use web-mode
(use-package web-mode
  :ensure t)

(provide 'init-php)
;;; init-php.el ends here
