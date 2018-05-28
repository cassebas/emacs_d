;;; package --- Summary
;; Customizations of various packages

;;; Commentary:

;;; Code:

;;; install color theme
(install-package 'spacemacs-theme)
(install-package 'color-theme-solarized)

;; systemd mode for editing systemd files
(install-package 'systemd)

;;; syntax highlighting
;(require 'mcrl2-syntax)

;;; Configure whitespaces
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark trailing)))
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46])   ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10])   ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))
(global-whitespace-mode 1)

;;; always show trailing whitespaces
(setq show-trailing-whitespace t)

(defun my-whitespace-settings (frame whitespace-color)
  " Correct some minor details for improvement of font-lock"
  (set-face-attribute 'font-lock-comment-face frame :background (face-background 'default))
  (set-face-attribute 'whitespace-trailing frame :foreground "NavajoWhite" :background (face-background 'default))
  (set-face-attribute 'whitespace-space frame :foreground whitespace-color :background (face-background 'default))
  (set-face-attribute 'whitespace-newline frame :foreground whitespace-color :background (face-background 'default))
  (set-face-attribute 'whitespace-tab frame :foreground whitespace-color :background (face-background 'default)))

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
(setq fci-rule-column 80)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; make sure emacsclient in daemon mode correctly uses color theme      ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (progn
                (set-frame-parameter frame 'background-mode 'dark)
                (set-terminal-parameter frame 'background-mode 'dark)
                (load-theme 'solarized t)
                (setq fci-rule-color "#00212A")
                (my-whitespace-settings frame "#00212A")))))

;;; Prevent startup screen
(setq inhibit-splash-screen t)

;;; Always highlight parentheses
(show-paren-mode t)

;;; Use electric to automatically insert closing parentheses, brackets and such
(electric-pair-mode t)

;;; Higlight current line
(setq global-hl-line-mode nil)

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;;; Turn on visual lines with word wrap, rebinding C-a and C-e
(global-visual-line-mode 1)

;;; Turn on line numbers
;; 2016-12-11 commented global linum mode, since it
;; disturbes some modes, e.g. mu4e (for mail)
;(global-linum-mode 1)

;;; no menu-bar nor tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;;; for writing latex
(install-package 'auctex)

;;; also show column number in the status bar
(setq column-number-mode t)

;; font
;; The following will make the font appear correctly in daemon mode
(add-to-list 'default-frame-alist '(font . "Inconsolata-14"))

;; Smart mode line
(install-package 'smart-mode-line)
(install-package 'smart-mode-line-powerline-theme)
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ace-jump-mode for quickly jump to specific words ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(install-package 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(define-key evil-normal-state-map (kbd "SPC j") 'ace-jump-mode)

;;
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key evil-normal-state-map (kbd "SPC J") 'ace-jump-mode-pop-mark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flyspell checking in text mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook 'flyspell-mode)


(provide 'init-misc)
;;; init-misc.el ends here
