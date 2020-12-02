call plug#begin('~/.local/share/nvim/plugged')

"For Airline "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"For using colorscheme generated by pywal"
"Plug 'dylanaraps/wal.vim'"

"theme"
Plug 'joshdick/onedark.vim'

"For highlighting colors"
Plug 'ap/vim-css-color'

"For git info in the gutter"
Plug 'airblade/vim-gitgutter'

"To insert brackets in pairs"
Plug 'jiangmiao/auto-pairs'

"Line intent"
Plug 'Yggdroot/indentLine'

"Git wrapper"
Plug 'tpope/vim-fugitive'

"File browser"
Plug 'tpope/vim-vinegar'

Plug 'sheerun/vim-polyglot'

"Markdown preview"
Plug 'iamcco/markdown-preview.vim'
call plug#end()

"Set Pywal generated colorsheme"
colorscheme onedark

"enable somethings"
set termguicolors
set number
set relativenumber
set nocompatible 
set undodir=~/.cache/nvim/undodir
set undofile

syntax on 
filetype plugin indent on

"set char encoding"
set encoding=utf8

"Disable arrow movement, resize splits instead"
let g:elite_mode=1
if get(g:, 'elite_mode') 
	nnoremap <Up> :resize +2<CR> 
	nnoremap <Down> :resize -2<CR> 
	nnoremap <Left> :vertical resize -2<CR> 
	nnoremap <Right> :vertical resize +2<CR> 
endif

"Split Management"
set splitbelow
set splitright
nmap <C-j> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"Airline settings"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})

let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

"Markdown preview settings"
let g:mkdp_path_to_chrome = "/usr/bin/firefox"
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
let g:mkdp_refresh_slow = 0

"intent settings"
let g:intentLine_setColors = 0
let g:intentLine_char = '┆'
