(install-package 'company)
(install-package 'company-c-headers)
(require 'company)
(require 'company-c-headers)
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

(setq company-backends (delete 'company-semantic company-backends))
(add-to-list 'company-backends 'company-c-headers)

(add-to-list 'company-c-headers-path-system "/usr/include")
(add-to-list 'company-c-headers-path-system "/usr/local/include")
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9")
(add-to-list 'company-c-headers-path-system "/usr/include/x86_64_linux-gnu/c++/4.9")


;;;;; flycheck
(install-package 'flycheck)
(global-flycheck-mode)

;;;;; yasnippet
;; (install-package 'yasnippet)
;; (require 'yasnippet)
;; (yas-global-mode t)


;;;;;
;;;;; other method for header completion (for reference or future activation)
;;;;;
;;(require-package 'auto-complete-c-headers)
;; (defun my:ac-c-header-init ()
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/usr/local/include /usr/include/x86_64-linux-gnu/c++/4.9 /usr/include/c++/4.9")
;;   ;(add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/4.9")
;;   ;(add-to-list 'achead:include-directories '"/usr/include/c++/4.9/backward")
;;   ;(add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include")
;;   ;(add-to-list 'achead:include-directories '"/usr/local/include")
;;   ;(add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed")
;;   ;(add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
;;   ;(add-to-list 'achead:include-directories '"/usr/include")
;; )
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)


(provide 'init-c_cpp)
