;;; package --- Summary
;; configuration for mu4e

;;; Commentary:
;; taken from
;; http://www.djcbsoftware.nl/code/mu/mu4e/Longer-configuration.html

;;; Code:
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)
;; use mu4e with evil key bindings
(install-package 'evil-mu4e)
(require 'evil-mu4e)

;; notify me when new mail arrives
(install-package 'mu4e-alert)
(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)

;; path to our Maildir directory
(setq mu4e-maildir "/home/caspar/Maildir")

;; Use gnus smtpmail
(setq message-send-mail-function 'smtpmail-send-it)

;; Default settings for smtpmail
(setq smtpmail-default-smtp-server "smtp.xs4all.nl"
      smtpmail-smtp-server "smtp.xs4all.nl"
      smtpmail-stream-type 'ssl
      smtpmail-smtp-service 465)

;; Define mu4e context for multiple mail accounts
(setq mu4e-contexts
      `(
        ,(make-mu4e-context
          :name "xs4allmail"
          :enter-func (lambda() (mu4e-message "Entering xs4allmail context"))
          :leave-func (lambda() (mu4e-message "Leaving xs4allmail context"))
          :match-func (lambda(msg) (when msg
                                     (mu4e-message-contact-field-matches msg
                                                                         :to "c.treijtel@xs4all.nl")))
          :vars '(
                  (user-mail-address . "c.treijtel@xs4all.nl")
                  (user-full-name . "Caspar Treijtel")
                  (smtpmail-smtp-server . "smtp.xs4all.nl")
                  (smtpmail-smtp-user . "cassebas")
                  ;; the list vars is already quoted so use unquoted starttls/ssl
                  (smtpmail-stream-type . ssl)
                  (smtpmail-smtp-service . 465)
                  (mu4e-trash-folder . "/xs4allmail/Trash")
                  (mu4e-sent-folder . "/xs4allmail/Sent")
                  (mu4e-drafts-folder . "/xs4allmail/Drafts")
                  )
          )
        ,(make-mu4e-context
          :name "tudelftmail"
          :enter-func (lambda() (mu4e-message "Entering tudelftmail context"))
          :leave-func (lambda() (mu4e-message "Leaving tudelftmail context"))
          :match-func (lambda(msg) (when msg
                                     (mu4e-message-contact-field-matches msg
                                                                         :to "c.treijtel@xs4all.nl")))
          :vars '(
                  (user-mail-address . "c.treijtel@student.tudelft.nl")
                  (user-full-name . "Caspar Treijtel")
                  (smtpmail-smtp-server . "smtp-a.tudelft.nl")
                  (smtpmail-smtp-user . "ctreijtel@tudelft.net")
                  ;; the list vars is already quoted so use unquoted starttls/ssl
                  (smtpmail-stream-type . ssl)
                  (smtpmail-smtp-service . 465)
                  (mu4e-trash-folder . "/tudelftmail/Deleted Items")
                  (mu4e-sent-folder . "/tudelftmail/Sent Messages")
                  (mu4e-drafts-folder . "/tudelftmail/Drafts")
                  )
          )
        )
      )

;; start with the first (default) context;
;; default is to ask-if-none (ask when there's no context yet, and none match)
(setq mu4e-context-policy 'pick-first)

;; the maildirs you use frequently; access them with 'J' ('jump')
;(setq mu4e-maildir-shortcuts
;    '(("/xs4allmail/inbox"  . ?i)
;      ("/xs4allmail/sent"   . ?s)))

; Prepend my own bookmark to the standard bookmarks list
(add-to-list 'mu4e-bookmarks
             (make-mu4e-bookmark
              :name "Inbox messages all accounts"
              :query "maildir:/xs4allmail/INBOX OR maildir:/tudelftmail/INBOX"
              :key ?i))


;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; enable picking attachment using dired ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compose messages in new frame ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mu4e-compose-in-new-frame t)


;; the headers to show in the headers list -- a pair of a field
;; and its width, with `nil' meaning 'unlimited'
;; (better only use that for the last field.
;; These are the defaults:
(setq mu4e-headers-fields
    '( (:human-date    .  25)    ;; alternatively, use :human-date
       (:flags         .   6)
       (:from          .  22)
       (:subject       .  nil))) ;; alternatively, use :thread-subject

;; program to get mail; alternatives are 'fetchmail', 'getmail'
;; isync or your own shellscript. called when 'U' is pressed in
;; main view.

;; If you get your mail without an explicit command,
;; use "true" for the command (this is the default)
;; Set to 'true' to have mu4e only update the index, the mail
;; retrieval is done by an external process (using a
;; systemd service unit).
(setq mu4e-get-mail-command "true")
;; Have mu4e update the index every 2 minutes.
;;  2017-06-21 switched to imapnotify for push notifications!
;;             set update interval to nil to disable periodic
;;             contacting the mail server;
(setq mu4e-update-interval nil)

;; customize the reply-quote-string
;; M-x find-function RET message-citation-line-format for docs
(setq message-citation-line-format "On %a, %b %d %Y at %r, %f wrote:\n")
(setq message-citation-line-function 'message-insert-formatted-citation-line)

;; general emacs mail settings; used when composing e-mail
;; the non-mu4e-* stuff is inherited from emacs/message-mode
;(setq mu4e-reply-to-address "c.treijtel@xs4all.nl"
;      user-mail-address "c.treijtel@xs4all.nl"
;      user-full-name  "Caspar Treijtel")
(setq mu4e-compose-signature
   "Caspar Treijtel")
(setq mu4e-compose-signature-auto-include nil)

;; Compose mail in a new frame
(setq mu4e-compose-in-new-frame t)

;; according to [[https://vxlabs.com/tag/mu4e/][vxlabs]]:
;; ``HTML has won the email format war''
;; Maybe [s]he's right:)
(setq mu4e-compose-format-flowed nil)

;; Don't cc myself
(setq mu4e-compose-keep-self-cc nil)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; don't keep asking me 'are you sure you want to quit?'
(setq mu4e-confirm-quit nil)

;; possible fix for having mu4e work togehter with mbsync
(setq mu4e-change-filenames-when-moving t)

(provide 'init-mu4e)
;;; init-mu4e.el ends here
