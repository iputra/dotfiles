" every changed in this configuration must be reload
" reload with this command :source $MYVIMRC

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
" set nobackup
" set noswapfile
 
set number                    " show numbering
set numberwidth=1
set laststatus=2              " 0: disable | 1: only if have more than one window | 2: always show statusline
set showtabline=2             " 0: disable | 1: only if have more than one window | 2: always show tabline
set t_Co=256                  " use 256 kind of color
set noshowmode
" set autoread                " reload when file change outside vim

" scheme vim
set background=dark           " you can set light or dark
colorscheme PaperColor
" colorscheme spacemacs-theme 

set cursorline                " set highlight a row of current cursor
set scrolloff=8               " auto scrolling before bottom and top as much 8 row
set wildmenu
set updatetime=250            " Update delay time for git gutter

" searching 
set incsearch                 " auto searching without pressing enter
set ignorecase                " make searching not case sensitive
set hlsearch                  " highlight all result of searching

" split
set splitbelow 
set splitright

" tab
set expandtab                   " Convert tabs into spaces
set softtabstop=4               " when editing
set smarttab
set laststatus=2
set tabstop=4                   " auto indent
set shiftwidth=4                " number space when tab keystrokes pressed

" C language 
autocmd Filetype c 
            \set makeprg=gcc\ -o\ %<\ %
autocmd Filetype c nnoremap <buffer> <F9> :Make<CR>
" autocmd Filetype c nnoremap <buffer> <F9> :w<CR>:!gcc % -o %< && ./%<<CR>
autocmd Filetype ruby nnoremap <buffer> <F9> :w<CR>:!ruby %<CR>
autocmd Filetype ruby setlocal shiftwidth=2 tabstop=2
              
" leader mapping
" change \ to ,
let mapleader = ","

" mapping keyboard
" map send key to command mode
" nnoremap mapping when normal mode
" inoremap mapping when insert mode
" vnoremap mapping when visual mode
" nb. if any error happen, it may cause there some char like space on EOL
nnoremap <F3> :set relativenumber!<CR>
nnoremap <F4> :IndentLinesToggle<CR>:LeadingSpaceToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F7> :VimShellPop<CR>
nmap <C-h> <C-w><C-h>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
map <Leader> <Plug>(easymotion-prefix)
nnoremap <leader>ri :RunInInteractiveShell<space>
nnoremap <leader>k :tabnext<CR>
nnoremap <leader>j :tabprevious<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader><tab> :tabedit<space>
nnoremap <leader>v :set paste!<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'edkolev/tmuxline.vim'
Bundle 'christoomey/vim-run-interactive'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ChesleyTan/wordCount.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'drmingdrmer/vim-tabbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'thinca/vim-quickrun'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'raimondi/delimitmate'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-syntastic/syntastic'
Plugin 'ngmy/vim-rubocop'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-vinegar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'hzchirs/vim-material'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required

" CONFIGURATION

" lightline for statusline and tabline
let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'size', 'worc'],
      \              [ 'fileformat', 'fileencoding', 'filetype', ] ],
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'llast': 'LastLine',
      \ },
      \ },
      \ }

     " \ 'component_function': {
      " \   'filename': 'lightlinefilename',
      " \ },
" function! LightlineFilename()
"     let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
"     let modified = &modified ? ' +' : ''
"     return filename . modified
" endfunction

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ca'
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_show_hidden=1
let g:ctrlp_open_new_file= 'v'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" change cursor to thin when insert mode 
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
    au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" configuration for fasting a delay back to normal " or go fast to esc 
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=0
    augroup END
endif

" vim shell
let g:vimshell_prompt="→ "

" syntastic
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers=['rubocop']
" " let g:syntastic_error_symbol = '😠'
" let g:syntastic_error_symbol = '⦿'
" " let g:syntastic_warning_symbol = '😑'
" let g:syntastic_warning_symbol = '⦿'
" highlight SyntasticErrorLine guifg=blue guibg=white gui=bold
" highlight SyntasticStyleErrorLine guifg=blue guibg=white gui=bold
" highlight SyntasticError guifg=blue guibg=white gui=bold
" highlight SyntasticStyleError guifg=blue guibg=white gui=bold
" highlight SyntasticWarningLine guifg=blue guibg=white gui=bold
" highlight SyntasticStyleWarningLine guifg=blue guibg=white gui=bold
" highlight SyntasticWarning guifg=blue guibg=white gui=bold
" highlight SyntasticStyleWarning guifg=blue guibg=white gui=bold

" other configuration
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" indentline character
let g:indentLine_enabled = 0
let g:indentLine_char = '⎢'
let g:indentLine_leadingSpaceChar = '𝅉'
let g:indentLine_leadingSpaceEnabled = 0
