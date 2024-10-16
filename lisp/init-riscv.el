;;; package --- Summary

;;; Commentary:

;;; Code:
(defun my-riscv-mode-hook ()
  (setq asm-comment-char ?#))

(add-hook 'asm-mode-hook #'my-riscv-mode-hook)

(provide 'init-riscv)
;;; init-riscv.el ends here
