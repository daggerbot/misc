set autoindent
set backspace=2
set backupdir=~/.vim/backup
set belloff=all
set colorcolumn=80,100,120
set directory=~/.vim/swap
set expandtab
set guioptions=
set list
set listchars=tab:>.,trail:_
set number
set shiftwidth=4
set softtabstop=4
set tabstop=8
set undodir=~/.vim/undo
syntax on

autocmd FileType automake setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
