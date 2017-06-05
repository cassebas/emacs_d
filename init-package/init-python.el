(install-package 'anaconda-mode)
(install-package 'pyenv-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'pyenv-mode)

;; The following function will be called upon a projectile
;; hook that will run when C-c p p is issued (projectile-switch-project)
(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))

(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)

(install-package 'company-anaconda)
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(provide 'init-python)
