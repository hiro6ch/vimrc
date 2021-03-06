" Pathogen 
execute pathogen#infect()
" SET
set nocompatible
set autoread
set si "Smart indet
set wrap "Wrap lines
set number

set backspace=indent,eol,start " make backspace a more flexible

set backup " make backup files
set backupdir=~/.vim/backup " where to put backup file
set wildmenu
set wildmode=list:full

set hlsearch
set wrapscan
set infercase

set ai
set ruler
set cursorline
set confirm
set laststatus=2
"set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]\ %{GitBranch()}%=\[Position=%l,%v,%p%%]
set statusline=\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]\ %{GitBranch()}%=\[Position=%l,%v,%p%%]
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype slim setlocal ts=2 sts=2 sw=2
set smarttab
set lbr
set tw=500

" syntax Color
syntax on 
colorscheme solarized
let g:solarized_termcolors=256
set t_Co=256
set background=dark

" Filetype
filetype on
filetype plugin on
filetype indent on
autocmd! BufNewFile,BufRead *.{ino,pde} setlocal ft=arduino
autocmd! BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} setlocal ft=markdown

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_skip_auto_completion_time = '0.3'
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" For ruby
autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" NERDTree
nmap  <F2> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.o$', '\~$', '\.a$', '\.bak$', '\.d$']
let NERDTreeWinPos='left'

" Tagbar
nmap <F8> :TagbarToggle<CR>

let g:vim_markdown_folding_disabled=1

" method = indent, syntax 
set foldmethod=indent
" folding 3 level
set foldnestmax=3
" add 2 column line on left side
set foldcolumn=1
" no folding level 1 
set foldlevel=1
" change color
hi folded ctermfg=25 guifg=SlateBlue

""""""""""""""""""""""""""""""""""
" status line diff mode diff color
function! InsertStatuslineColor(mode)
      if a:mode == 'i'
         hi statusline guibg=Black ctermfg=6 guifg=Cyan ctermbg=0
        elseif a:mode == 'r'
         hi statusline guibg=Black ctermfg=5 guifg=Purple ctermbg=0
        else
         hi statusline guibg=Black ctermfg=1 guifg=DarkRed ctermbg=0
      endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=White ctermfg=8 guifg=DarkGrey ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=White ctermfg=8 guifg=DarkGrey ctermbg=15
"""""""""""""""""""""""""""""""""""

" GUI
if has("gui_running")
" GUI is running or is about to start.
" Maximize gvim window.
   set lines=999 columns=999
endif
