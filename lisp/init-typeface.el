;;; package --- Summary
;; Customizations of various packages

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font (use add-to-list to make it appear in daemon mode)         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'default-frame-alist '(font . "Inconsolata-16"))
;; (add-to-list 'default-frame-alist '(font . "JetbrainsMono-13"))
(add-to-list 'default-frame-alist '(font . "Iosevka-15"))


(use-package ligature
  :load-path "path-to-ligature-repo"
  :config
  ;; Enable all Iosevka ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
                                       ;; ;; CT original line of Iosevka ligatures:
                                       ;; "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
                                       ;; ;; removed some of them for vhdl
                                       "<==" "<==="              "=>>" "==>" "===>"      "<=>" "<==>" "<===>" "<====>" "<!---"
                                       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
                                       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(provide 'init-typeface)
;;; init-typeface.el ends here
