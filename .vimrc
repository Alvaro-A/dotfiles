"Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab

"Other
set number
set relativenumber
set wildmenu
set nocompatible
syntax on
colorscheme dracula
"colorscheme rdark-terminal2
"colorscheme nord
"colorscheme one

set path+=**
set runtimepath^=~/.vim/pack/goyo.vim

"Templates
augroup Py
  au BufNewFile *.py 0r ~/.vim/templates/skeleton.py
augroup end

augroup C
  au BufNewFile *.c 0r ~/.vim/templates/skeleton.c
augroup end

augroup Cpp
  au BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
augroup end

augroup Header
  au BufNewFile *.h 0r ~/.vim/templates/skeleton.h
augroup end

"WIP to load different makefiles depending on the file present in
"the open directory
augroup Makefile
  if filereadable("main.c")
    au BufNewFile Makefile,makefile 0r ~/.vim/templates/skeleton.makec
  endif

augroup Latex
  "Load template
  au BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
 
 "Compile on write
  au BufWritePost main.tex silent execute "!sh $HOME/.vim/scripts/auto_latex %:t %:p:r --display"
 
 "Close upon leave
  au VimLeave main.tex execute "!sh $HOME/.vim/scripts/auto_latex %:t %:p:r --clean"
augroup end

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words

