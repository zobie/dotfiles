" stupid thing to set the path on mac if not started from a shell
" nicked from the default vimrc which was not ran at all
if has("macunix") && has("gui_running") && system('ps xw | grep -c "[V]im -psn"') > 0
  " Get the value of $PATH from a login shell.
  if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
    let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
    let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
  endif
endif

set autoindent
set nocompatible             " the past is better left in the past
set encoding=utf-8 nobomb    " BOM often causes trouble
set sessionoptions=folds,sesdir,tabpages,winsize
set expandtab shiftwidth=2 tabstop=2  " Ruby and JavaScript made me do it!
set noerrorbells
set visualbell               " must turn visual bell on to remove audio bell

"""""""""" visual
syntax on
set laststatus=2              " always show status line
set scrolloff=2               " minlines to show around cursor
set sidescrolloff=4           " minchars to show around cursor
set linebreak                 " when wrapping, try to break at characters in breakat
set breakat=\ ^I!@*-+;:,./?   " when wrapping, break at these characters
set showbreak=>               " character to show that a line is wrapped
" let loaded_matchparen = 1     " don't show matching brace when moving around, it's too slow

colorscheme railscasts

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set background=dark
set matchtime=2

set history=50                " keep 50 lines of command line history
set ruler                     " show the cursor position all the time
set showcmd                   " display incomplete commands

set hlsearch
set incsearch

" Enable file type detection.
filetype plugin indent on

set tabstop=2
set sw=2
set expandtab

" aliases for tabs
nnoremap <Leader>t :tabnew<Return>
nnoremap <Leader>> :tabn<Return>
nnoremap <Leader>< :tabp<Return>

" A nicer-looking tabline (vim7 only)
if exists(":tabnew") == 2
  highlight TabLine term=underline cterm=bold,underline ctermfg=Grey gui=underline
  highlight TabLineFill term=underline cterm=bold,underline gui=underline guibg=DarkGrey
  highlight TabLineSel term=reverse cterm=reverse gui=reverse
endif

" key used to toggle 'paste mode'
set pastetoggle=<F7>

" toggle highlighted words from search on/off
" map ctrl-n to toggle highlighting
nnoremap <silent> <C-n> :set hls!<CR>
" better search options
set ignorecase
set smartcase
" For filename completion in command mode
set wildmode=longest,list

"netrw
let g:netrw_browse_split=3

" tab completion
let g:no_omni_filetypes = ['php', 'ruby']
function! Tab_Or_Complete() 
  " next entry in popup menu
  if pumvisible()
    return "\<C-N>"
  endif
  " if not on whitespace
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$' 
    return "\<Tab>" 
   elseif count(g:no_omni_filetypes, &filetype) == 0 && exists('&omnifunc') && &omnifunc != '' 
    return "\<C-X>\<C-O>" 
  else 
    return "\<C-N>" 
  endif 
endfunction 
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" better complete popup options
set completeopt=menu,longest,preview
set pumheight=8
" ruby ^_^
let g:rubycomplete_buffer_loading = 1

" bling
set statusline=%f\ %m%r%h%w\ %y%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" os x clipboard
vnoremap <silent> <Leader>y !pbcopy<CR>u
nnoremap <silent> <Leader>p :read !pbpaste<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
