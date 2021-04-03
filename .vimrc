" Need to set this flag on in order to have many cool features on
set nocompatible
"set nofoldenable

" Use the OS clipboard by default
set clipboard=unnamed
"
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Hide buffers
set hidden
 
"" Display line numbers on the left
set number
 
"" Show command
set showcmd

"" Use mouse (only for resizing!)
set mouse=a
 
" Set the focus to the correct screen (ok, no more mouse thingies)
set mousefocus
 
" No more annoying sounds
set visualbell
 
" Do not scroll sideways unless we reach the end of the screen
set sidescrolloff=0
 
" highlight current line
set cursorline

" project vimrc

" hide scroll bar
set guioptions-=L
set guioptions-=r

" Infer the case-sensitivity
set infercase
 
" Remove - VIM from Window title 
set titlestring=%f

" Indent properly based on the current file
filetype plugin on
runtime macros/matchit.vim

" Plugins 

call plug#begin('~/.vim/plugins')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " for GBrowse
Plug 'tpope/vim-sleuth'

" Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mattn/emmet-vim'

" Editing & Nav
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-visual-star-search'
" Syntax
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" Visual Appeal
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'junegunn/goyo.vim' , { 'for' : 'markdown' }
Plug 'junegunn/limelight.vim', { 'for' : 'markdown' }
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'

" Colorschemes
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'

" Debugging
Plug 'xolox/vim-misc' " vim-session dependency
Plug 'xolox/vim-session'
Plug 'xuhdev/vim-latex-live-preview' , { 'for': 'tex' }

" LaTex
let g:tex_conceal = ""
let g:livepreview_previewer = 'open -a Preview'
autocmd Filetype tex setl updatetime=1000

" initialize plugin system
call plug#end()

set background=dark

if (has("termguicolors"))
  set termguicolors
endif

colorscheme one 
" Change default fontsize to fit MacBook Pro 13'
set guifont=Meslo\ LG\ L\ for\ Powerline:h15

" Don't select first Omni-completion option
set completeopt=longest,menuone
"set completeopt=menuone,longest,preview
 
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set hlsearch " Highlight the entire word when searching for it
set incsearch     " show search matches as you type
set smartcase  " ignore case if all lower
set ignorecase
set noexpandtab
set shiftwidth=4
set softtabstop=4
"set numberwidth=5
set wrap! " disable word wrap
 
" -------------
" Key Bindings
" -------------

let mapleader = ","

" reverse character search
noremap \ ,

" quit buffer without closing current window, leaves nerdtree hanging
nnoremap <leader>qb :bp\|bd #<CR>
nnoremap <leader>qe :qall<CR> 
nnoremap <leader>qw <C-w>c
nnoremap <leader>f :Ag 
nnoremap <leader>w :w<CR>

" Better split switching (Ctrl-j,k,l,h)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Clear search
map <leader>qs :noh<CR>
" Ctrlp Keys
map <leader>t :BTags<CR>
map <leader>T :Tags<CR>
map <leader>b :Buffers<CR>
map <leader>P :History<CR>
map <leader>p :Files<CR>
map <leader>ss :OpenSession 
map <leader>cd :cd %:p:h

" Use silver searcher to search across files
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ,cc does Comment Toggle
let g:NERDCreateDefaultMappings = 0
map <leader>cc <plug>NERDCommenterToggle
map <leader>cs <plug>NERDCommenterSexy

"Fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gB :Gbrowse<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gcon :Git mergetool<CR>
" Quick run via <F5>
nnoremap <leader>r :call <SID>compile_and_run()<CR>
nnoremap <leader>en :call <SID>stupefy()<CR>

" ---------
" End
" ---------

" Always set the current file directory as the local current directory
"autocmd BufEnter * silent! lcd %:p:h
 
set history=1000         " remember more commands and search history
 
" Tabs in command line mode behave like bash
set wildmode=longest,list,full
set wildmenu

" Centralize backups, swapfiles and undo history
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set tags+='~/.vim/tags'

" Sessions
let g:session_autoload='no'
let g:session_autosave='yes'

" Airline Plugin Settings
set ttimeoutlen=10

let python_highlight_all = 1

" Compilation

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:stupefy()
  exec 'w'
  exec "%!stupefy enchant %"
  exec "normal gg=G"
endfunction

" indented curly braces
let delimitMate_expand_cr = 1

" NERDTree settings
let NERDTreeRespectWildIgnore = 1

set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj
set wildignore+=*.min.js,*.pyc
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*

" Airline settings
set noshowmode " Don't show mode (airline does)
set laststatus=2 " alwasy show statusbar
let g:airline_powerline_fonts = 1 
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 0 
let g:airline#extensions#tabline#fnamemod = ':t' 

" indentLine
let g:indentLine_char = '┆'

" Use Tab to complete
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<Tab>"

" adds to statusline
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}

" a little more informative version of the above
nmap <Leader>sI :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"Custom syntax highlighting
hi pythonFunction guifg=#ffc24b ctermfg=215

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" save code folds
"augroup AutoSaveFolds
  "autocmd!
  "autocmd BufWinLeave * mkview
  "autocmd BufWinEnter * silent loadview
"augroup END
set foldmethod=syntax
set foldlevel=5

" Highlight tab & space in visual mode
aug my_visuallistchars
  set listchars=tab:>-,space:‧
  set cpoptions-=n 
  au!
  au CursorMoved * if mode() =~# "[vV\<C-v>]" | set list | else | set nolist | endif
aug END

let g:fzf_colors =
\ { "fg":      ["fg", "Normal"],
  \ "bg":      ["bg", "Normal"],
  \ "hl":      ["fg", "IncSearch"],
  \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
  \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
  \ "hl+":     ["fg", "IncSearch"],
  \ "info":    ["fg", "IncSearch"],
  \ "border":  ["fg", "Ignore"],
  \ "prompt":  ["fg", "Comment"],
  \ "pointer": ["fg", "IncSearch"],
  \ "marker":  ["fg", "IncSearch"],
  \ "spinner": ["fg", "IncSearch"],
  \ "header":  ["fg", "WildMenu"] }


"hi NonText ctermbg=none
"hi Normal ctermbg=none

" respect *ignore files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .DS_Store -g ""'

" vim-vue from vim-polygot
let g:vue_pre_processors = ['pug', 'scss']
let g:vue_pre_processors = 'detect_on_enter'

let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = { 'javascript': ['prettier']}
let g:ale_fix_on_save = 1

let g:user_emmet_expandabbr_key = '<leader>e'

