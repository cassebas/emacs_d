;;; package --- Summary

;;; Commentary:

;;; Code:
(use-package pyenv-mode
  :ensure t)
(add-hook 'python-mode-hook 'pyenv-mode)

;; Show line numbers when editing python code.
(add-hook 'python-mode-hook (lambda () (linum-mode 1)))

;; The following function will be called upon a projectile
;; hook that will run when C-c p p is issued (projectile-switch-project)
(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))

(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)

;; Tell flycheck where to find the flake8 config fiel
(setq flycheck-flake8rc "/home/caspar/.config/flake8")
(setq-default flycheck-disabled-checkers '(python-pylint))

;; Make sure that also when running from a different environment,
;; the pyenv path is set.
(setq exec-path (cons "/home/caspar/.pyenv/shims" exec-path))

;; Make sure that python can execute run the python debugger
;; without the pdb executable
(setq gud-pdb-command-name "python -m pdb")


;; (install-package 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-mode)

;; ;; Show the fill column indicator when editing python code.
;; (add-hook 'python-mode-hook (lambda () (fci-mode 1)))

;; (install-package 'company-anaconda)
;; (eval-after-load "company"
;;   '(add-to-list 'company-backends 'company-anaconda))

(provide 'init-python)
;;; init-python.el ends here
