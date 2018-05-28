;;; package --- Summary

;; configuration for notmuch

;;; Commentary:

;;; Code:

(autoload 'notmuch "notmuch" "notmuch mail" t)

;; Notmuch ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-define-key 'normal notmuch-search-mode-map
  (kbd "q") 'notmuch-search-quit
  (kbd "n") 'notmuch-search-next-thread
  (kbd "p") 'notmuch-search-previous-thread
  (kbd "RET") 'notmuch-search-show-thread)

;; Mail ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(evil-add-hjkl-bindings notmuch-search-mode-map 'emacs)
(evil-add-hjkl-bindings notmuch-show-mode-map 'emacs)
(evil-set-initial-state 'notmuch-search-mode 'emacs)
(evil-set-initial-state 'notmuch-show-mode 'emacs)

(provide 'init-mail)
;;; init-notmuch.el ends here
