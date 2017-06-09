(require 'cc-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
;;;;;;;;;; set style to "k&r";;;;;;;;;;;;;
(setq c-default-style "k&r")
;; But use 4 spaces for indentation instead of 5
(setq-default c-basic-offset 4)

(add-hook 'after-init-hook 'global-company-mode)


;;;;; Fill-column indicator in c-mode
(add-hook 'c-mode-hook (lambda () (fci-mode 1)))
(add-hook 'c++-mode-hook (lambda () (fci-mode 1)))

;;;;; Turn on line numbers in c-mode
(add-hook 'c-mode-hook (lambda () (linum-mode 1)))
(add-hook 'c++-mode-hook (lambda () (linum-mode 1)))

;;;;; flycheck
(install-package 'flycheck)
(global-flycheck-mode)

;;;;; yasnippet
;; (install-package 'yasnippet)
;; (require 'yasnippet)
;; (yas-global-mode t)

;;;;;;;;;;;;;;;;;;;;;;;
;;; Configure rtags ;;;
;;;;;;;;;;;;;;;;;;;;;;;

;(install-package 'auto-complete)
(install-package 'company)
;(install-package 'company-c-headers)

;; rtags.el is already installed in /usr/share/emacs/site-lisp/rtags
;; use the rtags.el from the AUR installed version, instead of the MELPA
;; version (to avoid version conflicts)
;  NOT: (install-package 'rtags)
(setq load-path (cons "/usr/share/emacs/site-lisp/rtags" load-path))
(require 'rtags)
(require 'company-rtags)
(require 'helm-rtags)
(require 'flycheck-rtags)

(setq rtags-use-helm t)

;(require 'company)
;(require 'company-c-headers)

;;; maybe start the rdm service [now is a systemd unit]
;(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
;(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)

(setq rtags-completions-enabled t)

;;; have standard keybindings (prefix for commands is C-c r)
(rtags-enable-standard-keybindings)

;;; some easy keybindings:
(define-key c-mode-base-map (kbd "M-.") (function rtags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function rtags-find-references-at-point))
(define-key c-mode-base-map (kbd "M-;") (function rtags-find-file))
(define-key c-mode-base-map (kbd "C-.") (function rtags-find-symbol))
(define-key c-mode-base-map (kbd "C-,") (function rtags-find-references))
(define-key c-mode-base-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key c-mode-base-map (kbd "M-i") (function rtags-imenu))
(define-key c-mode-base-map (kbd "M-n") (function rtags-next-match))
(define-key c-mode-base-map (kbd "M-p") (function rtags-previous-match))

;;;;; Irony mode for code completion
(install-package 'irony)
(install-package 'company-irony)

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(install-package 'company-irony-c-headers)
(require 'company-irony-c-headers)

(setq company-backends (delete 'company-semantic company-backends))
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony company-rtags)))

(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)

;; integrate irony with flycheck
(install-package 'flycheck-irony)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(provide 'init-c_cpp)
