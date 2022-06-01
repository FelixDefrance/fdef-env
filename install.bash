#!/usr/bin/env bash
set -e

declare -A files

pushd "$(dirname "${0}")" > /dev/null
workDir="$(pwd)"
popd > /dev/null

files["bash/.bash_aliases"]="${HOME}/.bash_aliases"
files["bash/.bash_custom_func"]="${HOME}/.bash_custom_func"
files["bash/.bash_profile"]="${HOME}/.profile"
files["bash/.bashrc"]="${HOME}/.bashrc"
files["bash/.bash_logout"]="${HOME}/.bash_logout"
files["bash/.inputrc"]="${HOME}/.inputrc"
files["git/.gitconfig"]="${HOME}/.gitconfig"
files["git/.gitignore"]="${HOME}/.gitignore"
files["htop/htoprc"]="${HOME}/.config/htop/htoprc"
files["tmux/.tmux.conf"]="${HOME}/.tmux.conf"
files["vim/.vimrc"]="${HOME}/.vimrc"
files["vim/apprentice.vim"]="${HOME}/.vim/colors/apprentice.vim"

if [ "X$(hostname)" = "Xstellar" ]; then
    files["vim/.vimrc.local"]="${HOME}/.vimrc.local"
    files["gnupg/gpg.conf"]="${HOME}/.gnupg/gpg.conf"
fi

echo "All files will be backuped to ${HOME}/fdef-env.$(date +%F).backup"
mkdir ${HOME}/fdef-env.$(date +%F).backup
for i in "${!files[@]}"; do
    [ -f "${files[$i]}" ] && mv "${files[$i]}" ${HOME}/fdef-env.$(date +%F).backup
    rm -f "${files[$i]}"
    mkdir -p "$(dirname "${files[$i]}")"
    ln -sv "${workDir}/${i}" "${files[$i]}"
done

echo "Environnement loaded!"
echo "You should logout or 'source ${HOME}/.profile' to reload the environnement."
