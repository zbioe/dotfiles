## Defaults

# unset fish greeting
set fish_greeting

# auto start x on login
if status is-login
    if test -z "$DISPLAY" -a (fgconsole 2>/dev/null || echo -1) = 1
        exec startx -- -keeptty
    end
end

## Binds
bind \eh 'backward-kill-bigword'

## Exports

# export pager
set -x PAGER less

# export plan9
if test -d /usr/local/plan9
   # if compiled manually
   set -x PLAN9 /usr/local/plan9
else
   # if from package manager
   set -x PLAN9 /usr/lib/plan9
end
set -x PATH $PATH $PLAN9/bin

# export python home bin
set  -x PATH $PATH $HOME/.local/bin

# export user bin
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/pbin

# export goroot
set -x GOROOT $HOME/goroot
set -x PATH $PATH $GOROOT/bin

# export gopath
set -x GOPATH $HOME/gopath
set -x PATH $PATH $GOPATH/bin

# export gobin
set -x GOBIN $HOME/gobin
set -x PATH $PATH $GOBIN

# export terminal
set -x TERMINAL alacritty

# export editor
set -x EDITOR "ei"
set -x VISUAL "ei"

# export browser
set -x BROWSER "chromium"

# export flutter
set -x PATH $PATH $HOME/flutter/bin

# export gcp sdk
set -x PATH $PATH $HOME/gcproot/bin

# export android studio
set -x PATH $PATH $HOME/android-studio/bin

# export gcp sdk
set -x PATH $PATH $HOME/google-cloud-sdk/bin

# export krew
set -x PATH $PATH $HOME/.krew/bin

# export cask
set -x PATH $PATH $HOME/.cask/bin

# export textlive (pdflatex)
set -x PATH $PATH /opt/texlive/2020/bin/x86_64-linux

# export java oracle jdk
set -x PATH $PATH /opt/java/jdk1.8.0_261/bin

# set default print screen
set -x PRS_FP $HOME/Images/lala.png

# export ghcup
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f $HOME/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH

# emacs bin
set -x PATH $PATH $HOME/.emacs.d/bin

# Nix
set -x NIX_LINK $HOME/.nix-profile

## Set up environment.
## This part should be kept in sync with nixpkgs:nixos/modules/programs/environment.nix
set -x NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"

## Set $NIX_SSL_CERT_FILE so that Nixpkgs applications like curl work.
set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt

set -x PATH $NIX_LINK/bin $PATH
starship init fish | source

set -x PATH $NIX_LINK/bin $PATH

set -x PATH $HOME/.cargo/bin $PATH

set -x LD_PRELOAD /data/libhostspriv.so
