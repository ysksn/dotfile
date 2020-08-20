"----------------------------------------------------------------------
" Start dein Settings.
"----------------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.cache/dein')
  call dein#begin($HOME . '/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add($HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim')


  call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
  call dein#add('cohama/lexima.vim')
  call dein#add('isRuslan/vim-es6')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('kana/vim-submode')
  call dein#add('kannokanno/previm')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('dense-analysis/ale')
  call dein#add('Yggdroot/indentLine')
  call dein#add('chr4/nginx.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"----------------------------------------------------------------------
" Start indenntLine Settings.
"----------------------------------------------------------------------
let g:indentLine_char_list = ['|', '¦']

"----------------------------------------------------------------------
" Start deoplete Settings.
"----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

"----------------------------------------------------------------------
" End deoplete Settings.
"----------------------------------------------------------------------

set number
set modeline
set foldmethod=marker
set foldmarker=----------FoldFromHere,----------FoldEndHere
set commentstring=###%s
colorscheme slate
set tabstop=2
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set clipboard+=unnamed
set clipboard+=autoselect
set nohlsearch
set noswapfile
set maxmempattern=3000
syntax enable
au BufRead,BufNewFile *.md set filetype=markdown

"--------------------------------------------------------------------
" Start NERDTree Settings.
"--------------------------------------------------------------------
" <C-e>でNERDTreeをオンオフ いつでもどこでも
nmap <silent> <C-x>      :NERDTreeToggle<CR>
vmap <silent> <C-x> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-x>      :NERDTreeToggle<CR>
imap <silent> <C-x> <Esc>:NERDTreeToggle<CR>
" cmap <silent> <C-x> <C-u>:NERDTreeToggle<CR> # Fix: ctags
" 引数なしでvimを開いたらNERDTreeを起動、
" 引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く
" autocmd vimenter * if !argc() | NERDTree | endif
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 無視するファイルを設定する
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
" 隠しファイルを表示するか
let g:NERDTreeShowHidden=0
" ブックマークやヘルプのショートカットをメニューに表示する
let g:NERDTreeMinimalUI=1
" +|`などを使ってツリー表示をするか
" 0 : 綺麗に見せる
" 1 : +|`などを使わない
let g:NERDTreeDirArrows=1
" マウス操作方法
" 1 : ファイル、ディレクトリ両方共ダブルクリックで開く
" 2 : ディレクトリのみシングルクリックで開く
" 3 : ファイル、ディレクトリ両方共シングルクリックで開く
let g:NERDTreeMouseMode=2
"--------------------------------------------------------------------
" End NERDTree Settings.
"--------------------------------------------------------------------

"--------------------------------------------------------------------
" 最後のカーソル位置を復元する
"--------------------------------------------------------------------
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
"--------------------------------------------------------------------

"--------------------------------------------------------------------
" rubocop
"--------------------------------------------------------------------
" let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['ruby', 'javascript'] }
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" " rubocop syntax check
" nnoremap <F8> :SyntasticCheck<CR>
" nnoremap <F9> :SyntasticToggleMode<CR>

"--------------------------------------------------------------------
" ALE
"--------------------------------------------------------------------
nnoremap <F9> :ALEToggle<CR>
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

"--------------------------------------------------------------------
" vim-ruby
"--------------------------------------------------------------------
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"--------------------------------------------------------------------
" vim-submode
"--------------------------------------------------------------------
call submode#enter_with('bufmove', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')

call submode#enter_with('movepane', 'n', '', '<C-w>l', '<C-w>l')
call submode#enter_with('movepane', 'n', '', '<C-w>h', '<C-w>h')
call submode#enter_with('movepane', 'n', '', '<C-w>k', '<C-w>k')
call submode#enter_with('movepane', 'n', '', '<C-w>j', '<C-w>j')
call submode#map('movepane', 'n', '', 'l', '<C-w>l')
call submode#map('movepane', 'n', '', 'h', '<C-w>h')
call submode#map('movepane', 'n', '', 'k', '<C-w>k')
call submode#map('movepane', 'n', '', 'j', '<C-w>j')
let g:submode_always_show_submode = 0
let g:submode_keep_leaving_key = 0
let g:submode_timeout = 0
let g:submode_timeoutlen = 1
let g:submode_leave_with_key = 1

"--------------------------------------------------------------------
" vim-airline plugins
"--------------------------------------------------------------------
function! AirLineInit()
  let g:airline#extensions#tabline#enabled = 1
endfunction

"--------------------------------------------------------------------
" previm
"--------------------------------------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'google-chrome'

"--------------------------------------------------------------------
" ctrlp.vim
"--------------------------------------------------------------------
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 14
