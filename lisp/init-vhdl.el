;;; package --- Summary

;;; Commentary:

;;; Code:
(require 'vhdl-mode)

;; Turn on line numbers in vhdl-mode
(add-hook 'vhdl-mode-hook (lambda () (linum-mode 1)))
(add-hook 'vhdl-mode-hook (lambda () (setq indent-tabs-mode t)))
(add-hook 'vhdl-mode-hook (lambda () (setq vhdl-indent-tabs-mode t)))
(add-hook 'vhdl-mode-hook (lambda () (setq tab-width 4)))

(provide 'init-vhdl)
;;; init-vhdl.el ends here
