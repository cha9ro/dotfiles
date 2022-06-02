" ------------ Bundle --------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=1

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'airblade/vim-gitgutter'
set updatetime=250


Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

Plugin 'frazrepo/vim-rainbow'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ----------- Manual Setting ------------
" setting
set fenc=utf-8
set backspace=indent,eol,start

" Visual
set number
set virtualedit=onemore
set smartindent
set showmatch
set wildmode=list:longest
syntax enable

" ColorScheme
colorscheme default
set background=dark
let g:gitgutter_override_sign_column_highlight=0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4

" Tab
" Visualize invisible words (tab is '▸-')
""set list listchars=tab:\▸\-
" Tab becomes sapce
set expandtab
" Tab's space = 2 (Not intend)
set tabstop=2
" Tab's space = 2 (Intend)
set shiftwidth=2


" Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" Keybind
nmap <Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
