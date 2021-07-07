# Source bash definitions
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

export PAGER=less
export EDITOR=vim

if [ $XDG_SESSION_TYPE = "wayland" ]; then export MOZ_ENABLE_WAYLAND=1; fi
