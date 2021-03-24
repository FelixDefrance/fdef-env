syntax on               " Highlight syntax
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set incsearch           " Incremental search
set expandtab           " Convert TAB in SPACE
"set backup              " Keep a backup file
"set backupdir=~/.vimbackupfiles


" Use evening theme instead of default theme when vimdiff is called.
if &diff
    colorscheme evening
endif

" Set the mouse mode to 'r'
if has('mouse')
  set mouse=""
endif


au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,nginx* if &ft == '' | setfiletype nginx | endif
autocmd BufRead,BufNewFile /etc/php5/fpm/* set syntax=dosini


" Finally, read local configuration
let localConfig = expand("~/.vimrc.local")
if filereadable(localConfig)
    execute 'source '.localConfig
endif
