;;; package --- Summary

;;; Commentary:

;;; Code:
(require 'package)

(customize-set-variable
 'package-archives
 '(("melpa" . "https://melpa.org/packages/")
   ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some global configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "init-package" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "local" user-emacs-directory))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some global packages, always enabled ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Syntax checking.
;; http://www.flycheck.org/
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; Auto-completions.
;; https://company-mode.github.io/
(use-package company
  :ensure t
  :config
  (global-company-mode))

;; Git
;; https://github.com/magit/magit
;; (global-set-key (kbd "C-c g s") 'magit-status)
(use-package magit
  :ensure t
  :bind (("C-c g s" . magit-status)))

(use-package undo-tree
  :ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some specific packages, with specific configs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'init-helm)
(require 'init-evil)
(require 'init-c_cpp)
;(require 'init-movepoint)
;(require 'init-java)
;(require 'init-ess)
;(require 'init-haskell)
;(require 'init-helm-gtags)
;(require 'init-latex)
;(require 'init-magit)
;(require 'init-mu4e)
;(require 'init-projectile)
;(require 'init-python)
;(require 'init-vhdl)
;(require 'init-misc)
;(require 'init-org)

;;; init.el ends here
