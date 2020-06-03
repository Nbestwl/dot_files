syntax on

set clipboard=unnamed
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set notermguicolors
set scrolloff=8
set colorcolumn=100
set encoding=UTF-8
" set splitbelow

"============= enable backspace =========================
set whichwrap+=<,>,h,l,[,]	" Wrapping to next or previous lines when moving
set backspace=2

"============= enable backspace =========================
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git', { 'do' : './install.py --all' }
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/mileszs/ack.vim.git'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'kaicataldo/material.vim'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'tpope/vim-surround' " replace quotes and symbols around the closing content 
Plug 'https://github.com/Raimondi/delimitMate.git' " auto complete quotes
Plug 'https://github.com/morhetz/gruvbox.git'

call plug#end()

" ====================== color schemes ==========================
let g:material_terminal_italics = 0
let g:material_theme_style = 'palenight'

set background=dark
colorscheme gruvbox
" ====================== color schemes ==========================

" ====================== key mappings ==========================
" remapping arrow keys to control window flow
nnoremap <Left> :wincmd h<CR>
nnoremap <Down> :wincmd j<CR>
nnoremap <Up> :wincmd k<CR>
nnoremap <Right> :wincmd l<CR>

let mapleader = " "

" file save and quit 
nnoremap <leader>s :w<CR> 
nnoremap <leader>q :q<CR>

" remapping control to window flow
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" search
nnoremap <leader>f :Ack 

map <Enter> o<ESC>

" buffer flow
nnoremap ˜ :bp<CR>
nnoremap π :bn<CR>

" window movements
nnoremap tn :tabnew<Space>
nnoremap tc :tabclose<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" fugitive mapping
nmap <leader>gs :Gstatus<CR>:20wincmd_<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" Go to definition
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
" ====================== key mappings ==========================

" ====================== nerd tree ==========================
" NERDTree plugin
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " Automatically open NERDTree when open 'vim'
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTreeToggle
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
" open a file in new tab
let NERDTreeMapOpenInTab='\r'
" set the window sizw
let g:NERDTreeWinSize=35
" keep nerd tree open in new tabs
autocmd BufWinEnter * NERDTreeMirror
" ====================== nerd tree ==========================

" ======================  airline ==========================
" Vim Airline
" Show Smarter Tab Line => Automatically display all buffers when there is
" only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '

let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" Vim Airline Themes
" let g:airline_theme='tomorrow'
" ======================  airline ==========================

" ======================  search ==========================
" Ctrip settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_clear_cache_on_exit = 0

" silver search
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif 
" ======================  search ==========================

" ====================== vim-devicon ==========================
" Vim-devicon settings
" Create a dictionary of the colors for later use
let g:sol = {
    \"gui": {
        \"base03": "#002b36",
        \"base02": "#073642",
        \"base01": "#586e75",
        \"base00": "#657b83",
        \"base0": "#839496",
        \"base1": "#93a1a1",
        \"base2": "#eee8d5",
        \"base3": "#fdf6e3",
        \"yellow": "#b58900",
        \"orange": "#cb4b16",
        \"red": "#dc322f",
        \"magenta": "#d33682",
        \"violet": "#6c71c4",
        \"blue": "#268bd2",
        \"cyan": "#2aa198",
        \"green": "#719e07"
    \},
    \"cterm": {
        \"base03": 8,
        \"base02": 0,
        \"base01": 10,
        \"base00": 11,
        \"base0": 12,
        \"base1": 14,
        \"base2": 7,
        \"base3": 15,
        \"yellow": 3,
        \"orange": 9,
        \"red": 1,
        \"magenta": 5,
        \"violet": 13,
        \"blue": 4,
        \"cyan": 6,
        \"green": 2
    \}
\}
function! DeviconsColors(config)
    let colors = keys(a:config)
    augroup devicons_colors
        autocmd!
        for color in colors
            if color == 'normal'
                exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                    \ 'else | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                    \ 'endif'
            elseif color == 'emphasize'
                exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                    \ 'else | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                    \ 'endif'
            else
                exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
            endif
            exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
        endfor
    augroup END
endfunction
let g:devicons_colors = {
    \'normal': ['', '', '', '', ''],
    \'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
    \'yellow': ['', '', ''],
    \'orange': ['', '', '', 'λ', '', ''],
    \'red': ['', '', '', '', '', '', '', '', ''],
    \'magenta': [''],
    \'violet': ['', '', '', ''],
    \'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
    \'cyan': ['', '', '', ''],
    \'green': ['', '', '', '']
\}
call DeviconsColors(g:devicons_colors)
" ====================== vim-devicon ==========================


