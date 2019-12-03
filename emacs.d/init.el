;; Botstrap

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

;; (scroll-bar-mode -1) ; remove scroll bar
(menu-bar-mode -1) ; remove menu bar
;; (tool-bar-mode -1) ; remove tool bar
;; (set-fringe-mode 0) ; Remove border
;; (global-font-lock-mode 0) ; remove color

(setq vc-follow-symlinks t) ; Allways follow the links

;; Theme
(load-theme 'dichromacy)

;; Package
(load-file "~/.emacs.d/packages.el")

;; Keys
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)

;; Doc
(global-set-key "\C-cd" 'zeal-at-point)

;; ido-mode on (buffer manager)
(ido-mode 1)


(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save)
        )
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!")))
  )

(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active")
        )
    (insert (shell-command-to-string "xsel -o -b"))
    )
  )

(global-set-key (kbd "C-c w") 'copy-to-clipboard)
(global-set-key (kbd "C-c y") 'paste-from-clipboard)

; Google translate

(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pt")

(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
