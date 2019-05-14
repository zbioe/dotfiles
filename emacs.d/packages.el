(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
             ("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("elpy" . "https://jorgenschaefer.github.io/packages/")))
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

; list the packages you want
(setq package-list '(
	magit
	markdown-mode

	;; json
	json-mode

	;; csv
	csv-mode

	;; docker
	dockerfile-mode

	;; elixir
	elixir-mode
	alchemist

	;; doc
	zeal-at-point

	;; python
	python-mode

	;; fish
	fish-mode

	;; erlang
	erlang

	;; go-lang
	go-mode

	;; haskell
	haskell-mode
	hindent

	))

; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
