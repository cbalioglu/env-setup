set cindent                     " Apply the C indenting rules.
set shiftwidth=4                " Indent by 4 spaces when using >>, <<, ==, and automatic indentation.
set softtabstop=4               " Indent by 4 spaces when pressing <TAB>.
set expandtab                   " Use the appropriate number of spaces to insert a <Tab>.
set backspace=indent,eol,start  " Allow backspacing over indention, line breaks, and start of an insert.

set ignorecase                  " Do case insensitive matching.
set smartcase                   " Override the 'ignorecase' option if the search pattern contains upper case characters.
set incsearch                   " While typing a search command, show where the pattern, as it was typed so far, matches.
set showmatch                   " Show matching brackets.
set nohlsearch                  " Stop highlighting the search matches.

set noswapfile                  " Do not create swapfiles for buffers.
set autowrite                   " Automatically save before commands like :next and :make.

set number                      " Precede each line with its line number.
set list                        " Show whitespace characters.
set lcs=tab:>-,trail:.          " Strings (listchars) to use in 'list' mode.
set nowrap                      " Do not wrap lines longer than the width of the window.
set sidescroll=0                " Puts the cursor in the middle of the screen after each scroll.
set laststatus=2                " Always show the status line.
set showcmd                     " Show command in status line.
set wildmenu                    " Show command line completions over the status line.
set ruler                       " Show the line and column number of the cursor position, separated by a comma.
set colorcolumn=80              " Highlight a comma separated list of screen columns with ColorColumn.

syntax on

autocmd FileType py,pyi setlocal colorcolumn=88
autocmd FileType cmake,h,hpp,cc,cpp setlocal colorcolumn=100

" Show directories before files in netrw.
let g:netrw_sort_sequence='\/$,*'

" Use ack.vim with ag.
let g:ackprg='ag --vimgrep'

" Enable all Python syntax highlighting features.
let g:python_highlight_all=1

" Set the color scheme to tomorrow-night.
set background=dark

let base16colorspace=256

source ~/.vimrc_background
