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
;;;;;;;;;; set style to "linux";;;;;;;;;;;;;
(setq c-default-style "bsd")

(install-package 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;(company-mode t)

(install-package 'company-c-headers)
(require 'company-c-headers)

(eval-after-load "c-mode"
		 '(define-key c-mode-map [(tab)] 'company-complete))
(eval-after-load "c++-mode"
		 '(define-key c++-mode-map [(tab)] 'company-complete))
(add-to-list 'company-backends 'company-c-headers)

(add-to-list 'company-c-headers-path-system
             (quote
              ("/usr/include"
               "/usr/local/include"
               "/usr/include/c++/4.9"
               "/usr/include/x86_64-linux-gnu/c++/4.9")))

(provide 'init-c_cpp)
