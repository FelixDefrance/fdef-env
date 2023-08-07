# Source profile local definitions
if [ -f $HOME/.profile.local ]; then source $HOME/.profile.local; fi
# Source bash definitions
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

export PAGER=less
export EDITOR=vim

if [ "X$XDG_SESSION_TYPE" = "Xwayland" ]; then export MOZ_ENABLE_WAYLAND=1; fi
