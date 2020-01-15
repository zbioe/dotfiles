;; Botstrap

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(menu-bar-mode -1) ; remove menu bar
;; (global-font-lock-mode 0) ; remove color

;; some graphic configs
(when (display-graphic-p)
  (scroll-bar-mode -1) ; remove scroll bar
  (tool-bar-mode -1) ; remove tool bar
  (set-fringe-mode 0)) ; Remove border

(setq vc-follow-symlinks t) ; Allways follow the links

;; Theme
(load-theme 'dichromacy)

;; Package
(load-file "~/.emacs.d/packages.el")

;; Some changes in default keys
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-s") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Keys for move in panels
(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)

;; Doc
(global-set-key "\C-cd" 'zeal-at-point)

;; ido-mode on (buffer manager)
;; (ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)


;; Copy and paste from X clipboard

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
