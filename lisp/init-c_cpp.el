;;; package --- Summary

;;; Commentary:

;;; Code:
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

;;;;; Turn on line numbers in c-mode
(add-hook 'c-mode-hook (lambda () (line-number-mode 1)))
(add-hook 'c++-mode-hook (lambda () (line-number-mode 1)))

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(provide 'init-c_cpp)
;;; init-c_cpp.el ends here
