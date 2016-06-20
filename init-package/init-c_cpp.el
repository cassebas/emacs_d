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

(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)



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

(install-package 'auto-complete)
(install-package 'company)
(install-package 'company-c-headers)
(install-package 'rtags)

(require 'company)
(require 'company-c-headers)

;;; maybe start the rdm service
(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)

;;; have standard keybindings (prefix for commands is C-c r)
(rtags-enable-standard-keybindings)

;;; some easy keybindings:
(define-key c-mode-base-map (kbd "M-.") (function tags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function tags-find-references-at-point))
(define-key c-mode-base-map (kbd "M-;") (function tags-find-file))
(define-key c-mode-base-map (kbd "C-.") (function tags-find-symbol))
(define-key c-mode-base-map (kbd "C-,") (function tags-find-references))
(define-key c-mode-base-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key c-mode-base-map (kbd "M-i") (function tags-imenu))

;;; work together with company
(add-to-list 'company-c-headers-path-system "/usr/include")
(add-to-list 'company-c-headers-path-system "/usr/local/include")
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9")
(add-to-list 'company-c-headers-path-system "/usr/include/x86_64_linux-gnu/c++/4.9")
;; configure backends for company
(setq rtags-completions-enabled t)
(setq company-backends (delete 'company-semantic company-backends))
(push 'company-rtags company-backends)
(push 'company-c-headers company-backends)
(global-company-mode)

(provide 'init-c_cpp)
