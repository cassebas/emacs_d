;;; package --- Summary

;; Java customization

;;; Commentary:

;;; Code:


;; ;;;;; Default tabs :(
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode t)))

(add-hook 'java-mode-hook (lambda ()
                            (setq global-hl-line-mode nil)))

(add-hook 'java-mode-hook 'linum-mode)

(provide 'init-java)
;;; init-java.el ends here
