"lianxiang.zhou vim setting
"
set nocompatible
filetype plugin on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => display setting
set number
set ruler
set laststatus=2
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => color setting
set t_Co=256
colo koehler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search setting
set hlsearch
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagList
nmap tl :TlistToggle<cr>
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => winManager
nmap wm :WMToggle<cr>:wincmd t<cr>
let g:winManagerWidth=30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => miniBufExplorer
let g:miniBufExplMapWindowNavVim=1
nmap mb :TMiniBufExplorer<cr>
nmap <C-LEFT> :MBEbp<CR>
nmap <C-RIGHT> :MBEbn<CR>

""""""""""""""""""""""""""""""
" => Ctags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"set tags=tags;
"set autochdir

""""""""""""""""""""""""""""""
" => Cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" => hot key
nmap =d :r !date +\%y\%m\%d\%H\%M<CR>
nmap =p :set paste<CR>
nmap =e :set nopaste<CR>
nmap =<LEFT> :vert res -10<CR>
nmap =<RIGHT> :vert res +10<CR>
nmap =<UP> :res -10<CR>
nmap =<DOWN> :res +10<CR>
