;;; package --- Summary

;;; Commentary:

;;; Code:

(install-package 'projectile)
(install-package 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'init-projectile)
;;; init-projectile ends here
