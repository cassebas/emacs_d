;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; evil for vim key-bindings  ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(install-package 'evil)
(install-package 'evil-leader)

;;;; evil-leader will provide me with a shortcut-keybinding for commands
;;;; enable before enabling evil
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "f" 'helm-find-files
 "b" 'switch-to-buffer
 "g" 'magit-status
 "k" 'kill-buffer
 "p" 'projectile-find-file)


(require 'evil)
(evil-mode t)
;;; i like evil but I do want my C-e back!
(define-key evil-normal-state-map (kbd "C-e") 'end-of-visual-line)
(define-key evil-motion-state-map (kbd "C-e") 'end-of-visual-line)
;;; make movement keys work like they should while using visual-line-mode
(define-key evil-normal-state-map (kbd "<remap> <evil-beginning-of-line>") 'evil-beginning-of-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-end-of-line>") 'evil-end-of-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
;;; make horizontal movement cross lines
(setq-default evil-cross-lines t)

(provide 'init-evil)
