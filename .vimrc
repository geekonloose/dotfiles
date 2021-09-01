set nocompatible " VI compatible mode is disabled so vim things work
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Per file editor config
Plugin 'ciaranm/securemodelines'
Plugin 'editorconfig/editorconfig-vim'


" Search
Plugin 'romainl/vim-cool'               " Disables highlight when search is done
Plugin 'haya14busa/incsearch.vim'       " Better incremental search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " FZF plugin, makes Ctrl-P unnecessary
Plugin 'junegunn/fzf.vim'

" Movement
Plugin 'justinmk/vim-sneak'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'wikitopian/hardmode'            " Disable arrow keys and similar

" Text Manipulation
Plugin 'tpope/vim-sensible'             " Some better defaults
Plugin 'tpope/vim-unimpaired'           " Pairs of mappings
Plugin 'tpope/vim-surround'             " Surround with parentheses & co
Plugin 'joom/vim-commentary'            " To comment stuff out
Plugin 'terryma/vim-multiple-cursors'   " Multiple cursors like sublime
Plugin 'godlygeek/tabular'              " For alignment
Plugin 'junegunn/vim-easy-align'        " Easier alignment
Plugin 'foosoft/vim-argwrap'            " convert lists of arguments into blocks of arguments
" Interacts with coc Plug 'tpope/vim-endwise'              " Ends control flow indentifiers
Plugin 'tpope/vim-repeat'               " Adds repeat thorugh . to other packages
Plugin 'tpope/vim-speeddating'          " Dates in vim

" GUI enhancements
Plugin 'itchyny/lightline.vim'          " Better Status Bar
Plugin 'mhinz/vim-startify'             " Better start screen
Plugin 'scrooloose/nerdtree'            " File explorer


" Syntactic language support
Plugin 'plasticboy/vim-markdown'         " Markdown support
Plugin 'mzlogin/vim-markdown-toc'        " Markdown TOC builder
Plugin 'lervag/vimtex'                   " Latex support
Plugin 'mechatroner/rainbow_csv'         " CSV color coding
Plugin 'ap/vim-css-color'                " CSS colors
Plugin 'frazrepo/vim-rainbow'                " Rainbow parentheses
Plugin 'vim-pandoc/vim-pandoc'           " Pandoc support
Plugin 'vim-pandoc/vim-pandoc-syntax'    " Pandoc syntax
Plugin 'chrisbra/colorizer'              " Colorize color codes
Plugin 'vim-python/python-syntax'

" Colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'         " Base16 themes
" Plug 'gerw/vim-hilinktrace'            " Syntax Highlighting Tracer
" Plug 'fatih/molokai'                  " Monokai and friends
" Plug 'crusoexia/vim-monokai'
" Plug 'phanviet/vim-monokai-pro'
Plugin 'patstockwell/vim-monokai-tasty'
" Plug 'erichdongubler/vim-sublime-monokai'
" Plug 'flazz/vim-colorschemes'          " Bunch of color schemes
Plugin 'sainnhe/sonokai'                 " Monokai Pro-like scheme
Plugin 'tanvirtin/monokai.nvim'


" Writing
Plugin 'junegunn/goyo.vim'               " Distraction free mode
Plugin 'junegunn/limelight.vim'          " Focus on current paragraph
Plugin 'rhysd/vim-grammarous'            " GrammarCheck using LanguageTool
Plugin 'ron89/thesaurus_query.vim'       " Synonym query

" Other
" Plugin 'wakatime/vim-wakatime'           " Wakatime time tracking
Plugin 'liuchengxu/vim-which-key'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required





" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 0

if has('gui_running')
    colorscheme base16-gruvbox-dark-hard
elseif exists("+termguicolors")
    set termguicolors
    " The commands below are needed for tmux + termguicolors
    " This is only necessary if you use "set termguicolors".
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " fixes glitch? in colors when using vim with tmux
    set background=dark
    set t_Co=256

    colorscheme vim-monokai-tasty
    " colorscheme sonokai
    " let g:sonokai_style = 'shusia'

elseif &t_Co < 256
    colorscheme molokai
    set nocursorline " looks bad in this mode
endif





let g:python_highlight_all = 1

syntax on           " enable syntax processing

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
set relativenumber      " show relative numbering
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    "Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set linebreak           " Have lines wrap instead of continue off-screen
set scrolloff=12        " Keep cursor in approximately the middle of the screen
set updatetime=100      " Some plugins require fast updatetime
set ttyfast             " Improve redrawing

" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden              " Allows having hidden buffers (not displayed in any window)

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start     " Make backspace behave in a more intuitive way
nmap Q <Nop>
" 'Q' in normal mode enters Ex mode. You almost never want this.
" Unbind for tmux
map <C-a> <Nop>
map <C-x> <Nop>
" this is a comment so you remember this later
" insert mode; no recursive; map; <from>; <to>
inoremap jj <Esc> 

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered
" turn off search highlight
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>
" Ignore files for completion
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir


" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" This is especially useful for me since I spend my days in Python.
" Other acceptable values are marker, manual, expr, syntax, diff.
" Run :help foldmethod to find out what each of those do.


" Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]


" (Shift)Tab (de)indents code
vnoremap <Tab> >
vnoremap <S-Tab> <

" Capital JK move code lines/blocks up & down
" TODO improve functionality
nnoremap K :move-2<CR>==
nnoremap J :move+<CR>==
xnoremap K :move-2<CR>gv=gv
xnoremap J :move'>+<CR>gv=gv

" =============================================================================
"   PLUGIN CONFIG
" =============================================================================
"
" META: Disabled by default
let g:gitgutter_enabled = 0          " vim-gitgutter
let g:indentLine_enabled = 0         " indentline
let g:SignatureEnabledAtStartup = 0  " vim-signature
let g:startify_custom_header =[]     " Disable startify header
" Enabled by default
let g:rainbow_active = 1

" Minor Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * Gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" * NERDTree
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" * FZF
set rtp+=/usr/local/opt/fzf
let g:fzf_layout = { 'down': '~20%' }


" * Limelight
let g:limelight_conceal_ctermfg = 'gray'
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!


" * SuperTab
" Tab goes down instead of up
" let g:SuperTabDefaultCompletionType = "<c-n>"

" GitGutter
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" vimtex
let g:tex_flavor = "latex"

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



" Secure Modelines
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

