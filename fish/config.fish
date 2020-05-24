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
set -gx PATH $PATH $HOME/.krew/bin