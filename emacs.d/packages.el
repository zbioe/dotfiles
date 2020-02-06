(require 'package)

;; repositories to find packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("elpy" . "https://jorgenschaefer.github.io/packages/")))
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; list of packages to install
(setq package-list '(

        dracula-theme

	smerge-mode

	markdown-mode

	dockerfile-mode

	elixir-mode
	alchemist

	zeal-at-point

	python-mode

	fish-mode

	erlang

	go-mode

	haskell-mode
	hindent
	))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
