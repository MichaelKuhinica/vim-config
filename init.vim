" COLOR {{{
" colorscheme
set background=dark
"NOTE: this has to execute before setting any colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
colorscheme molokai
" turn on syntax highlighting
syntax on
" }}}
" SPACES AND TABS {{{
" number of visual spaces per TAB
set tabstop=2
" number of spaces in tab when editing
set softtabstop=2
" tabs are spaces
set expandtab
" }}}
" UI CONFIG {{{
" adds line numbers to the left
set number
" Relative line numbers
set relativenumber
" show command in bottom bar
set showcmd
" highlight current line
set cursorline
" load filetype-specific indent files
filetype indent on
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to.
set lazyredraw
" highlight matching [{()}]
set showmatch
" Visual bell only
set visualbell
set timeoutlen=1000 ttimeoutlen=0
"uses OS clipboard if possible (check +clipboard)
set clipboard=unnamed
"store lots of :cmdline history
set history=1000
"mark the ideal max text width
if exists('+colorcolumn')
  set colorcolumn=80
else
endif
"whitespace in the end of the lines stuff
"http://vim.wikia.com/wiki/Highlight_unwanted_spaces
nnoremap <LEADER>W a<ESC><Bar>:%s/\s\+$//<Bar><CR>``:noh<CR>
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd WinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()
" Indent
set autoindent
set copyindent
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
" Modelines at the bottom
set modelines=1
set ttyfast
" }}}
" SEARCHING {{{
" search as characters are entered
set incsearch
" highlight matches
set hlsearch
" turn off search highlight
nnoremap <LEADER>, :noh<CR>
"ignores case
set ignorecase
"do not ignore case if explicitly defined on the search
"by search for an uppercased pattern
set smartcase
"defaults to search for every match of the pattern
set gdefault
set showmatch
"highlight searches by default
set hlsearch
"find the next match as we type the search
" }}}
" FOLDING {{{
" enable folding
set foldenable
" open most folds by default
set foldlevelstart=10
" 10 nested fold max
set foldnestmax=10
" fold by indent
set foldmethod=indent
" }}}
" MOVEMENT {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" Use control+up/down to move fast
nnoremap <C-j> 12j
nnoremap <C-k> 12k
vnoremap <C-j> 12j
vnoremap <C-k> 12k
" highlight last inserted text
nnoremap gV `[v`]
" Tabs
nnoremap <LEADER>[ :bp<CR>
nnoremap <LEADER>] :bn<CR>
" }}}
" LEADER {{{
" leader is space
let mapleader = "\<Space>"
" jj to exit insert mode quickly
inoremap jj <ESC>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" save session
nnoremap <leader>s :mksession<CR>
" Traverse windows vertically
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }}}
" PACKAGES {{{
" dein
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/mkuhinica/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/mkuhinica/.vim/bundle')
  call dein#begin('/Users/mkuhinica/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/mkuhinica/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('sjl/gundo.vim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('mileszs/ack.vim')
  call dein#add('tpope/vim-fugitive', {'on_cmd' : 'Gdiff'})
  call dein#add('pangloss/vim-javascript')
  call dein#add('cakebaker/scss-syntax.vim')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('JamshedVesuna/vim-markdown-preview')
  call dein#add('jszakmeister/vim-togglecursor')
  call dein#add('tomtom/tlib_vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('benmills/vimux')
  call dein#add('rbgrouleff/bclose.vim')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('tpope/vim-obsession')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/syntastic')
  call dein#add('tpope/vim-surround')
  call dein#add('YankRing.vim')
  call dein#add('bling/vim-airline')
  call dein#add('janko-m/vim-test')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
" }}}
" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" }}}
" CtrlP {{{
let g:ctrlp_map='<LEADER>p'
let g:ctrlp_max_height=20
let g:ctrlp_max_files=2000000
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
" }}}
" Markdown Preview {{{
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-s>'
let vim_markdown_preview_toggle=2
" }}}
" GitGutter {{{
nmap <Leader>hp <Plug>GitGutterPreviewHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nnoremap <Leader>ga :Git add %:p<CR><CR>
" }}}
" Fugitive {{{
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <LEADER>b :Gblame<CR>
" }}}
" Syntastic {{{
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" }}}
" YankRing {{{
let g:yankring_history_file='.yankring_history'
nmap <LEADER>y :YRShow<CR>
" }}}
" NERDTree {{{
" Open Menu
noremap <LEADER>z :NERDTreeToggle<CR>
" Find current fule on menu
nnoremap <LEADER>f :NERDTreeFind<CR>
"}}}
" vim test {{{
let test#strategy = 'vimux'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
" }}}
" BACKUP {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" vim:foldmethod=marker:foldlevel=0