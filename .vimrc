" 背景色
"set bg=light
set bg=dark

set encoding=utf-8
scriptencoding utf-8
syntax enable
filetype plugin indent on


call plug#begin('~/.vim/plugged')
Plug 'vim-jp/vimdoc-ja'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'tikhomirov/vim-glsl'
Plug 'cocopon/iceberg.vim'

call plug#end()


hi clear
syntax enable

" Terminal 背景にする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme iceberg


" 自動保存
augroup Vimrc
  autocmd!
  autocmd InsertLeave * call <SID>auto_save()
  function! s:auto_save()
    if filewritable(expand('%'))
      write
    endif
  endfunction
augroup END

" #---- 全体？
" - 行表示
set number

" - コピペ設定
set clipboard+=unnamed
" - 改行設定
set wrap
" 現在の行を強調表示
set cursorline
set noundofile
set noswapfile
set nobackup

" #--- edit 処理系
" インデントをスペース2つ分に設定
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
" インデントを調整
set smartindent



" Macのターミナルで全角記号の表示がずれる問題への対応
set ambiwidth=double

" 空白表示
set list

set listchars=tab:»-,trail:-,nbsp:%
"set listchars+=space:∙
set listchars+=space:･

" #--- StatusLine 処理系
"常に Status Line を表示する
set laststatus=2

" StatusLINE設定
function! SetStatusLine()
  if mode() =~ 'i'
    let c = 1    "// カラー設定
    let mode_name = 'Insert'
  elseif mode() =~ 'n'
    let c = 2     "// カラー設定
    let mode_name = 'Normal'
  elseif mode() =~ 'R'
    let c = 3    "// カラー設定
    let mode_name = 'Replace'
  else
    let c = 4    "// カラー設定
    let mode_name = 'Visual'
  endif
  return '%' . c . '* [ ' . mode_name . ' ] %* %<%F%=%m%r %([%l/%L]%)%{strftime(" %m/%d_%H:%M ")}'
endfunction
set statusline=%!SetStatusLine()


""hi User1 guibg=#53343b guifg=#cdd1e6
""hi User2 guibg=#2a3158 guifg=#cdd1e6
""hi User3 guibg=#3e445e guifg=#ccd1e6
""hi User4 guibg=#384851 guifg=#cdd1e6

" Insert 赤系
hi User1 ctermfg=252 ctermbg=97
" Normal 青系
hi User2 ctermfg=252 ctermbg=24
" Replace 橙系
hi User3 ctermfg=252 ctermbg=95
" Visual  緑系
hi User4 ctermfg=252 ctermbg=30




" カッコ自動補完
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
""inoremap < <><LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap ` ``<LEFT>
inoremap 「 「」<LEFT>

" 表示行単位で上下移動するように
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 逆に普通の行単位で移動したい時のために逆の map も設定しておく
nnoremap gj j
nnoremap gk k

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

noremap PP "0p
noremap x "_x
