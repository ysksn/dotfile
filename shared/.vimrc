"----------------------------------------------------------------------
" Start dein Settings.
"----------------------------------------------------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME . '/.cache/dein')
  call dein#begin($HOME . '/.cache/dein')

  " Let dein manage dein Required:
  call dein#add($HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
  call dein#add('cohama/lexima.vim')
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
  call dein#add('elzr/vim-json')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('rust-lang/rust.vim')

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
" indenntLine Settings.
"----------------------------------------------------------------------
let g:indentLine_char_list = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

"----------------------------------------------------------------------
" deoplete Settings.
"----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('num_processes', 5)
call deoplete#custom#option('max_list', 2000)
call deoplete#custom#option('auto_complete_delay', 100)
call deoplete#custom#option('smart_case', v:true)
call deoplete#custom#option('enable_at_startup', v:true)
call deoplete#custom#option('enable_buffer_path', v:true)
call deoplete#custom#option('enable_refresh_always', v:false)

set tags=./tags;,tags
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
" vim-json
"--------------------------------------------------------------------
let g:vim_json_syntax_conceal = 0

"--------------------------------------------------------------------
" NERDTree Settings.
"--------------------------------------------------------------------
nmap <silent> <C-x>      :NERDTreeToggle<CR>
vmap <silent> <C-x> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-x>      :NERDTreeToggle<CR>
imap <silent> <C-x> <Esc>:NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=0
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeMouseMode=2

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
" ALE
"--------------------------------------------------------------------
nnoremap <F9> :ALEToggle<CR>
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
"--------------------------------------------------------------------
" vim-ruby
"--------------------------------------------------------------------
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
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

"--------------------------------------------------------------------
" rust.vim
"--------------------------------------------------------------------
let g:rustfmt_autosave = 1
