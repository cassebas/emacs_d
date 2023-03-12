;;; package --- Summary
;; Customizations of various packages

;;; Commentary:

;;; Code:

;;; no menu-bar nor tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color theme and easy switching between dark/light               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package doom-themes
  :config
  ;; Global settings (default)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	    doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-spacegrey t)
  ;; Corrects (and improves) org-modes's native fontification
  (doom-themes-org-config))

;; my-color-theme: ONLY use either solarized-light or solarized-dark
;; (setq my-color-theme 'solarized-dark)

;; (use-package solarized-theme
;;   :ensure t
;;   :init
;;   (load-theme my-color-theme t))

;; (use-package heaven-and-hell
;;   :ensure t
;;   :init
;;   (setq heaven-and-hell-theme-type 'dark) ;; Omit to use light by default
;;   (setq heaven-and-hell-themes
;;         '((light . solarized-light)
;;           (dark . solarized-dark))) ;; Themes can be the list: (dark . (tsdh-dark wombat))
;;   :hook (after-init . heaven-and-hell-init-hook)
;;   :bind (("C-c <f6>" . heaven-and-hell-load-default-theme)
;;          ("<f6>" . heaven-and-hell-toggle-theme)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font (use add-to-list to make it appear in daemon mode)         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'default-frame-alist '(font . "Inconsolata-16"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs should backup files in a special directory, not visited file directory ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; have default spelling dictionary 'dutch'                        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ispell-dictionary "dutch")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure whitespaces                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark trailing)))
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46])   ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10])   ; 10 LINE FEED
    (tab-mark 9 [9657 9] [92 9]) ; 9 TAB, 9657 WHITE RIGHT-POINTING SMALL TRIANGLE 「▹」
    ))
(global-whitespace-mode 1)

(defun my-whitespace-settings (frame whitespace-color trailing-color)
  "Correct some minor details for improvement of font-lock.  FRAME is the current frame or nil, can be nil.  WHITESPACE-COLOR is the color for the foreground of whitespaces."
  ;; for now reversed foreground and background (bug in solarized-emacs package?)
  (set-face-attribute
   'font-lock-comment-face frame :background (face-background 'default))
  (set-face-attribute
   'whitespace-trailing frame :background whitespace-color :foreground trailing-color)
  (set-face-attribute
   'whitespace-space frame
   :foreground whitespace-color :background (face-background 'default))
  (set-face-attribute
   'whitespace-newline frame :foreground whitespace-color :background (face-background 'default))
  ;; for now reversed foreground and background (bug in solarized-emacs package?)
  (set-face-attribute
   'whitespace-tab frame :foreground whitespace-color :background (face-background 'default)))

;; Let the foreground whitespace markers have color Gainsboro (kinda darkish white)
;; (my-whitespace-settings nil "#002028" "#A44343")
;; (if (eq my-color-theme 'solarized-dark)
;; 	(my-whitespace-settings nil "#002028" "#a44343")
;; 	(my-whitespace-settings nil "Gainsboro" "#95ed7b"))
(my-whitespace-settings nil "#21252e" "#a44343")
 
;;; Prevent startup screen
(setq inhibit-splash-screen t)

;;; Always highlight parentheses
(show-paren-mode t)

;;; Use electric to automatically insert closing parentheses, brackets and such
(electric-pair-mode t)

;;; also show column number in the status bar
(setq column-number-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure tabs                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; But use space to indent by default
(setq-default indent-tabs-mode nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart mode line ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  (sml/apply-theme 'respectful)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on line numbers for elisp files ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add hook for elisp files, the other programming languages are handled in
;; their own configs.
(add-hook 'emacs-lisp-mode-hook (lambda () (linum-mode t)))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;;; fill column indicator      ;;;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (install-package 'fill-column-indicator)
;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode global-fci-mode fci-mode
;;   (lambda()
;;     (if (and
;;          (not (string-match "^\*.*\*$" (buffer-name)))
;;          (not (eq major-mode 'dired-mode)))
;;         (fci-mode t))))
;; (setq fci-rule-column 80)

;; ;;; Higlight current line
;; (setq global-hl-line-mode nil)

;; ;;; Turn on visual lines with word wrap, rebinding C-a and C-e
;; (global-visual-line-mode 1)

;; ;;; for writing latex
;; (install-package 'auctex)


;; ;; Smart mode line
;; (install-package 'smart-mode-line)
;; (install-package 'smart-mode-line-powerline-theme)
;; (setq sml/no-confirm-load-theme t)
;; (setq sml/theme 'respectful)
;; (sml/setup)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ace-jump-mode for quickly jump to specific words ;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (install-package 'ace-jump-mode)
;; (autoload
;;   'ace-jump-mode
;;   "ace-jump-mode"
;;   "Emacs quick move minor mode"
;;   t)

;; (define-key evil-normal-state-map (kbd "SPC j") 'ace-jump-mode)

;; ;;
;; ;; enable a more powerful jump back function from ace jump mode
;; ;;
;; (autoload
;;   'ace-jump-mode-pop-mark
;;   "ace-jump-mode"
;;   "Ace jump back:-)"
;;   t)
;; (eval-after-load "ace-jump-mode"
;;   '(ace-jump-mode-enable-mark-sync))

;; (define-key evil-normal-state-map (kbd "SPC J") 'ace-jump-mode-pop-mark)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; flyspell checking in text mode ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'text-mode-hook 'flyspell-mode)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; which-key - display key bindings ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package which-key
  :config
  (which-key-mode 1))


(provide 'init-misc)
;;; init-misc.el ends here
