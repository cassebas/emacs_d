;;; package --- Summary

;;; Commentary:

;; If using use-package, then this makes each use-package form also invoke straight.el
;; to install the package, unless otherwise specified.
(setq straight-use-package-by-default t)

;;; Code:
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;;;  Effectively replace use-package with straight-use-package
(straight-use-package 'use-package)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some global configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some global packages, always enabled ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Syntax checking.
;; http://www.flycheck.org/
(use-package flycheck
  :config
  (global-flycheck-mode))

;; Auto-completions.
;; https://company-mode.github.io/
(use-package company
  :config
  (global-company-mode))

;; Git
;; https://github.com/magit/magit
(use-package magit)

(use-package undo-tree)
(setq undo-tree-auto-save-history nil)
(global-undo-tree-mode)

(use-package cmake-mode
  :ensure t
  :mode "CMakeLists.txt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some specific packages, with specific configs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-typeface)
(require 'init-helm)
(require 'init-evil)
(require 'init-c_cpp)
(require 'init-haskell)
(require 'init-python)
(require 'init-php)
(require 'init-misc)
(require 'init-org)
(require 'init-treemacs)
(require 'init-latex)
(require 'init-vhdl)
(require 'init-scala)
(require 'init-riscv)
;(require 'init-java)
;(require 'init-ess)
;(require 'init-magit)
;(require 'init-mu4e)
;(require 'init-projectile)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; --- *Maybe* enable these configs --- ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (require 'mcrl2-syntax)
; (require 'color-theme-eclipse)


;;; init.el ends here
