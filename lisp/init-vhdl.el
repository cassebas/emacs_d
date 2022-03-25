;;; package --- Summary

;;; Commentary:

;;; Code:
(require 'vhdl-mode)

;; Turn on line numbers in vhdl-mode
(add-hook 'vhdl-mode-hook (lambda () (linum-mode 1)))
(add-hook 'vhdl-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'vhdl-mode-hook (lambda () (setq vhdl-indent-tabs-mode nil)))

(setq vhdl-basic-offset 2)

(provide 'init-vhdl)
;;; init-vhdl.el ends here
