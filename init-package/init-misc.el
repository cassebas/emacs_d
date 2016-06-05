;;; Customizations of various packages

;;; syntax highlighting
;(require 'mcrl2-syntax)

;;; Prevent startup screen
(setq inhibit-splash-screen t)

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

;;; Turn on visual lines with word wrap, rebinding C-a and C-e
(global-visual-line-mode 1)

;;; Turn on line numbers
(global-linum-mode 1)

(provide 'init-misc)

