set modeline
set foldmethod=marker
set foldmarker=----------FoldFromHere,----------FoldEndHere
set commentstring=###%s
colorscheme koehler
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set clipboard+=unnamed
set clipboard+=autoselect
set nohlsearch
set noswapfile
syntax enable
" http://qiita.com/kuwana/items/d9778a9ec42a53b3aa10
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>)]}
au BufRead,BufNewFile *.md set filetype=markdown

"----------------------------------------------------------------------
" Start Neobundle Settings.
"----------------------------------------------------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundle 'kana/vim-submode'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'marijnh/tern_for_vim', {
  \ 'build': {
  \   'others': 'npm install'
  \}}
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'linux' : 'make',
  \     'unix' : 'gmake',
  \    },
  \ }
NeoBundleLazy 'vim-ruby/vim-ruby', {
  \ 'autoload' : {'filetypes' : ['ruby', 'eruby']}}
" gem install rubocop bitclust-core bitclust-dev refe2
" bitclust setup --versions=2.2.0
" mv ~/.bitclust ~/.dotfiles/[osx|linux]/
" ln -s ~/.dotfiles/[osx|linux]/.bitclust ~/
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'tpope/vim-rails'
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}
" vim-autoclose conflicts neocomplete
"NeoBundle 'Townk/vim-autoclose'
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"--------------------------------------------------------------------
" End Neobundle Settings.
"--------------------------------------------------------------------
"
"--------------------------------------------------------------------
" neocomplete.vim Configuration Examples from
" https://github.com/Shougo/neocomplete.vim
" Start neocomplete Settings.
"--------------------------------------------------------------------
"
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup()."\<Space>" : "\<Space>"

" For cursor moving in insert mode(Not recommended)
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
  " For perlomni.vim setting. https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
  let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"--------------------------------------------------------------------
" End neocomplete Settings.
"--------------------------------------------------------------------
"--------------------------------------------------------------------
" Start NERDTree Settings.
"--------------------------------------------------------------------
" <C-e>でNERDTreeをオンオフ いつでもどこでも
nmap <silent> <C-x>      :NERDTreeToggle<CR>
vmap <silent> <C-x> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-x>      :NERDTreeToggle<CR>
imap <silent> <C-x> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-x> <C-u>:NERDTreeToggle<CR>
" 引数なしでvimを開いたらNERDTreeを起動、
" 引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く
autocmd vimenter * if !argc() | NERDTree | endif
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
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'javascript'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_check_on_open = 0
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
