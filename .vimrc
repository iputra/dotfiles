set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

set number
set laststatus=2
set t_Co=256
set noshowmode
set background=dark
colorscheme PaperColor
set cursorline
set scrolloff=8
set wildmenu

" searching 
set incsearch
set ignorecase
set hlsearch
nnoremap <F4> :nohlsearch<CR>
nnoremap <F5> :NERDTreeToggle<CR>

" split
set splitbelow
set splitright

" tab
set expandtab                   " Convert tabs into spaces
set softtabstop=4               " when editing
set smarttab
set numberwidth=1
set laststatus=2
set tabstop=4
set shiftwidth=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'edkolev/tmuxline.vim'
Bundle 'christoomey/vim-run-interactive'
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'drmingdrmer/vim-tabbar'
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
Plugin 'vim-syntastic/syntastic'
Plugin 'ngmy/vim-rubocop'

call vundle#end()            " required
filetype plugin indent on    " required

" configuration
let g:lightline = {
      \ 'colorscheme': 'PaperColor_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction

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

" delay back to normal
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=0
    augroup END
endif

map <Leader> <Plug>(easymotion-prefix)
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
nnoremap <leader>ri :RunInInteractiveShell<space>

" vim shell
let g:vimshell_prompt="→ "

" syntastic
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers=['rubocop']
" let g:syntastic_error_symbol = '😠'
let g:syntastic_error_symbol = '⦿'
" let g:syntastic_warning_symbol = '😑'
let g:syntastic_warning_symbol = '⦿'
" highlight SyntasticErrorLine guifg=blue guibg=white gui=bold
" highlight SyntasticStyleErrorLine guifg=blue guibg=white gui=bold
" highlight SyntasticError guifg=blue guibg=white gui=bold
" highlight SyntasticStyleError guifg=blue guibg=white gui=bold
" highlight SyntasticWarningLine guifg=blue guibg=white gui=bold
" highlight SyntasticStyleWarningLine guifg=blue guibg=white gui=bold
" highlight SyntasticWarning guifg=blue guibg=white gui=bold
" highlight SyntasticStyleWarning guifg=blue guibg=white gui=bold
