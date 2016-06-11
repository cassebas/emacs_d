;;; Customizations of various packages

;;; install color theme
(install-package 'spacemacs-theme)

;;; syntax highlighting
;(require 'mcrl2-syntax)

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

(defun my-whitespace-settings (whitespace-color)
  " Correct some minor details for improvement of font-lock"
  (set-face-attribute 'font-lock-comment-face nil :background "inherit")
  (set-face-attribute 'whitespace-space nil :foreground whitespace-color)
  (set-face-attribute 'whitespace-newline nil :foreground whitespace-color)
  (set-face-attribute 'whitespace-tab nil :foreground whitespace-color))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; make sure emacsclient in daemon mode correctly uses color theme      ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (require 'spacemacs-dark-theme)
                  (my-whitespace-settings "gray26"))))
  (require 'spacemacs-light-theme)
  (my-whitespace-settings "gainsboro"))

;;; Prevent startup screen
(setq inhibit-splash-screen t)

;;; Always highlight parentheses
(show-paren-mode t)

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

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
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda()
    (if (and
         (not (string-match "^\*.*\*$" (buffer-name)))
         (not (eq major-mode 'dired-mode)))
        (fci-mode t))))
(global-fci-mode t)
(setq fci-rule-column 80)
(if (daemonp)
    (setq fci-rule-color "gray26")
  (setq fci-rule-color "gainsboro"))

;;; also show column number in the status bar
(setq column-number-mode t)

;; font
;(set-default-font "SourceCodePro-10")
(set-default-font "DejaVuSansMono-9")

(provide 'init-misc)
