;;; package --- Summary

;;; Commentary:

;;; Code:
(use-package vhdl-ext
  :hook ((vhdl-mode . vhdl-ext-mode))
  :init
  ;; Can also be set through `M-x RET customize-group RET vhdl-ext':
  ;; Comment out/remove the ones you do not need
  (setq vhdl-ext-feature-list
        '(font-lock
          xref
          capf
          hierarchy
          eglot
          lsp
          flycheck
          beautify
          navigation
          template
          compilation
          imenu
          which-func
          hideshow
          time-stamp
          ports))
  :config
  '((vhdl-ext-mode-setup)
    (vhdl-ext-eglot-set-server 've-rust-hdl)
    (vhdl-ext-lsp-set-server 've-rust-hdl)))

;; Turn on line numbers in vhdl-mode
(add-hook 'vhdl-mode-hook (lambda () (display-line-numbers-mode 1)))
(add-hook 'vhdl-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'vhdl-mode-hook (lambda () (setq vhdl-indent-tabs-mode nil)))
(add-hook 'vhdl-mode-hook (lambda () (setq vhdl-modify-date-on-saving nil)))

(setq vhdl-basic-offset 2)

(provide 'init-vhdl)
;;; init-vhdl.el ends here
