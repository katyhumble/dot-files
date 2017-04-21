execute pathogen#infect()
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

set nonu
set nowrap
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set ic
set ruler
set showmode
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2
syntax on
set hlsearch
set ignorecase
set incsearch
set gfn=Lucida_Console:h10:cANSI

set clipboard=unnamed " allow p, yy, D to add to the OS clipboard

set viminfo='200,<300,s150,%,h,!

behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

au BufNewFile,BufRead *.KTM setfiletype c

"colorscheme murphyo
"colorscheme evening
"colorscheme slate
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


function! Remove()
"comment
echo "hola"
":s/hola/adios/g
:%s/>/>\r/g
:g/^$/d
:g/^ $/d
:syntax on
endfunction

nmap <silent>  ;r  :call Remove()<CR>
"colors koehler
