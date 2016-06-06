(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "init-package" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "local" user-emacs-directory))

(defvar default-packages '(magit
                           evil-magit
                           company
                           company-c-headers
                           flycheck 
                           undo-tree))

(defun install-default-packages()
  "Install required packages"
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package default-packages)
    (unless(package-installed-p package)
      (package-install package))))

(install-default-packages)

(defun install-package (package)
  "Install given package"
  (unless(package-installed-p package)
    (package-install package)))

(require 'init-c_cpp)
(require 'init-evil)
(require 'init-helm)
(require 'init-helm-gtags)
(require 'init-magit)
(require 'init-python)
(require 'init-misc)
