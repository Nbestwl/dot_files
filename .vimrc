source ~/.vimrc_coc

syntax on
autocmd BufWritePre * :%s/\s\+$//e " remove trailing sapce on save
" set tabsize to 2 for javascript
autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2 expandtab
" disable trailing space highlight in python file
let python_highlight_space_errors = 0

set splitbelow splitright         " open the split on right and below
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
set autoindent
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
"============= enable backspace =========================
set whichwrap+=<,>,h,l,[,]	" Wrapping to next or previous lines when moving
set backspace=2
"============= enable backspace =========================
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'kaicataldo/material.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround' " replace quotes and symbols around the closing content
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/rainbow_parentheses.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " If you have nodejs and yarn
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets' " Collection of Snippets, used by coc-snippet
Plug 'majutsushi/tagbar'
Plug 'vim-test/vim-test'
Plug 'gurpreetatwal/vim-avro'

call plug#end()
" ====================== color schemes ==========================
" let g:material_theme_style = 'palenight'
" colorscheme material

let g:gruvbox_italicize_strings = 1
" let g:gruvbox_contrast_dark = 'hard'

set background=dark
colorscheme gruvbox
" ====================== color schemes ==========================

" ====================== commands ==========================
command! Reload :source ~/.vimrc
" ====================== commands ==========================

" ====================== rainbow_parentheses ==========================
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" ====================== rainbow_parentheses ==========================

" ====================== key mappings ==========================
let mapleader = " "

" coc mapping
nmap <leader>rr <Plug>(coc-rename)

" file save and quit
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
" delete the current buffer
nnoremap <leader>w :bd<CR>
" paste with register "0
nnoremap <leader>p "0p<CR>
nnoremap <leader>P "0P<CR>

" remapping arrow keys to control window flow
nnoremap <Left> :wincmd h<CR>
nnoremap <Down> :wincmd j<CR>
nnoremap <Up> :wincmd k<CR>
nnoremap <Right> :wincmd l<CR>

" remapping control to window flow
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

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
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :G commit<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars=""

" Functions for increasing/decreasing tabstop and shiftwidth
function! IncreaseTab()
  exe 'set tabstop+=1'
  exe 'set shiftwidth+=2'
endfunction
function! DecreaseTab()
  exe 'set tabstop-=1'
  exe 'set shiftwidth-=2'
endfunction

" Map Leader tab j and k to decrease or increase tabstop and shiftwidth
:map <Leader><Tab>j :call DecreaseTab()<Enter>
:map <Leader><Tab>k :call IncreaseTab()<Enter>

" latex shortcut
map <leader>la :ter ++close ++hidden latexmk -pvc %<CR>
" ====================== key mappings ==========================

" ====================== fzf ==========================
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Keymapping for fzf
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>H :History:<CR>
nmap <Leader>/ :Ag<CR>
" search the word under the cursor
nmap <Leader>// :Ag <C-R><C-W><CR>
nmap <Leader>c :Commits<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>M :Maps<CR>
" ====================== fzf ==========================

" ====================== nerd tree ==========================
" NERDTree plugin
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " Automatically open NERDTree when open 'vim'
" Close vim if only NERDTree is open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTreeToggle
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
" open a file in new tab
let NERDTreeMapOpenInTab='\r'
" ignore the following files / folder
let g:NERDTreeIgnore = ['^node_modules$']
" set the window sizw
let g:NERDTreeWinSize=40
" keep nerd tree open in new tabs
autocmd BufWinEnter * NERDTreeMirror
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

map <leader>r :NERDTreeFind<CR>
" ====================== nerd tree ==========================

" ======================  airline ==========================
" Vim Airline
" Show Smarter Tab Line => Automatically display all buffers when there is
" only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '

let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
" ======================  airline ==========================

" ======================  markdown ==========================
nmap <C-p> <Plug>MarkdownPreviewToggle
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css = '~/github_markdown.css'
" ======================  markdown ==========================

" ====================== sneak ==========================
let g:sneak#label = 1
let g:sneak#prompt = '🔎'
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
" ====================== sneak ==========================

" ====================== tagbar ==========================
nmap <Leader>tt :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1
let g:tagbar_width = 60
" ====================== tagbar ==========================

" color the nerdtree folder icon correctly
source ~/.vimrc_devicon
