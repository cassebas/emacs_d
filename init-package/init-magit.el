;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Custom key bind for much used magit-status
(global-set-key (kbd "C-c g s") 'magit-status)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; A setting for ediff, prefer side by side if frame size is big enough
;; (setq ediff-split-window-function
;;       (if (> (frame-width) 100)
;;           'split-window-horizontally
;;         'split-window-vertically))
;; dynamic behaviour not (yet) working properly
(setq ediff-split-window-function 'split-window-horizontally)

(provide 'init-magit)
;;; init-magit.el ends here
