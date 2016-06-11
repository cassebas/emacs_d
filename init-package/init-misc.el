;;; Customizations of various packages

;;; syntax highlighting
;(require 'mcrl2-syntax)
(install-package 'spacemacs-theme)
;(require 'spacemacs-dark-theme)
(require 'spacemacs-light-theme)

;;; Prevent startup screen
(setq inhibit-splash-screen t)

;;; Always highlight parentheses
(show-paren-mode t)

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;;; Configure whitespaces
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46])   ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10])   ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))
(global-whitespace-mode 1)

;; correct some minor details for improvement of font-lock
(set-face-attribute 'font-lock-comment-face nil :background "inherit")
(set-face-attribute 'whitespace-newline nil :foreground "gainsboro")
(set-face-attribute 'whitespace-tab nil :foreground "gray")

;;; Turn on visual lines with word wrap, rebinding C-a and C-e
(global-visual-line-mode 1)

;;; Turn on line numbers
(global-linum-mode 1)

;;; for writing latex
(install-package 'auctex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; fill column indicator      ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(install-package 'fill-column-indicator)
(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda() (fci-mode t)))
(global-fci-mode t)

;;; also show column number in the status bar
(setq column-number-mode t)

(provide 'init-misc)
