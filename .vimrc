" ----------- Manual Setting ------------
" setting
set fenc=utf-8

" Visual
set number
set virtualedit=onemore
set smartindent
set showmatch
set wildmode=list:longest
syntax enable


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

" Simple keybind
nmap <Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> jj <ESC>
