" == Prelude == {{{

" Disable Vi compatibility.
" Option must be set early for its side-effects.
set nocompatible

" Disable filetype detection.
" This is required by Vundle, before loading plugins.
filetype off

" Add Vundle to runtime path.
set rtp+=~/.vim/bundle/Vundle.vim

" }}}

" == Plugin Loading == {{{

" Begin plugin loading.
call vundle#begin()

" == Required ==
" Vundle.vim (pretty self explanatory).
Plugin 'gmarik/Vundle.vim'

" == Aesthetic ==

" Solarized colorscheme plugin.
Plugin 'altercation/vim-colors-solarized'

" == Integration ==

" Git.
Plugin 'tpope/vim-fugitive'

" == Utility ==

" Statusline.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Filebrowser.
"Plugin 'scrooloose/nerdtree'

" Fuzzy file finder.
"Plugin 'kien/ctrlp.vim'

" Formatting
"Plugin 'chiel92/vim-autoformat'

" == Completion ==

" Realtime completion.
 Plugin 'Valloric/YouCompleteMe'
" Plugin 'rdnetto/ycm-generator'

" == Syntax ==

" Syntax highlighting.
Plugin 'scrooloose/syntastic'

" == Language ==

" Rust
"Plugin 'rust-lang/rust.vim'

" GLSL
"Plugin 'tikhomirov/vim-glsl'

" TOML
"Plugin 'cespare/vim-toml'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Javascript
"Plugin 'pangloss/vim-javascript'

" Racket
"Plugin 'wlangstroth/vim-racket'

" Haskell
"Plugin 'neovimhaskell/haskell-vim'
"Plugin 'alx741/vim-hindent'

" Kotlin
"Plugin 'udalov/kotlin-vim'

" == Misc ==

" Vimproc
"Plugin 'shougo/vimproc.vim'

" End Vundle.vim plugin listing.
call vundle#end()

" }}}

" == General Settings == {{{

" Enable filetype detection, plugin and indent file loading.
filetype plugin indent on

" Enable backspace deletion of indentation, line breaks and characters before
" the initial insert cursor position.
set backspace=indent,eol,start

" Indentation
" set cindent
set cinoptions+=N-s
set cinoptions+=g0
set cinoptions+=+0
" set autoindent
" set smartindent

" Enable line numbering.
set number

" Enable ruler. Cursor line and column number.
set ruler

" Enable hidden buffer mode.
set hidden

" Enable incremental searching.
set incsearch

" Enable search highlighting.
set hlsearch

" Set background to Solarized Dark.
set background=dark

" Set colorscheme to Solarized.
colorscheme solarized

" Enable syntax highlighting.
syntax on

" Always display status line.
set laststatus=2

" Disable swapfile.
set noswapfile

" Don't add empty newlines at the end of files.
set binary

" Display incomplete commands.
set showcmd

" Set UTF-8 encoding.
set encoding=utf-8

" Highlight the current line.
set cursorline

" Disable error bells.
set noerrorbells

" Ignore case in searches.
set ignorecase

" Don't reset cursor to start of line when moving around.
set nostartofline

" Set default character limit to 80
set textwidth=80

" Default tab settings.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Distinguish the character limit with a colored column.
set colorcolumn=+1

" Optimize for fast terminal connections.
set ttyfast

" Enable mouse with urxvt mode.
set mouse=a
set ttymouse=urxvt

" Pane splitting settings.
" set diffopt complained on macOS.
"set diffopt+=vertical
set splitbelow
set splitright

" Command timeouts.
set timeoutlen=1000
set ttimeoutlen=0


" }}}

" == Key Mappings == {{{

" Instead of setting mapleader to <Space>, map <Space> to <leader>.
" This way it will pop up in the showcmd corner. (Thank you /u/pandubear).
map <Space> <leader>

" Clear highlighting.
nnoremap <leader>c :nohl<CR>

" When in visual mode, execute . as a normal mode command.
vnoremap . :norm.<CR>

" Window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Convenience mappings
"nnoremap <leader>d :NERDTreeToggle<CR>
"nnoremap <leader>p :CtrlP<CR>
"nnoremap <leader>t :TagbarToggle<CR>
"nnoremap <leader>f :YcmCompleter Format<CR>
nnoremap <leader>a za

" }}}

" == Plugin Settings == {{{

" == YouCompleteMe ==
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 0
"let g:ycm_rust_src_path = '/home/cpjreynolds/rust/src'

" == Statusline ==
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()}

" == Syntastic ==
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = { 'regex': 'snake_case\|superfluous-parens\|missing-module-docstring' }
" == Syntastic - Racket Settings ==
"let g:syntastic_enable_racket_racket_checker = 1
" == Syntastic - Kotlin Settings ==
" SLOW
"let g:syntastic_kotlin_checkers = ['kotlinc']
"let g:syntastic_enable_kotlin_kotlinc_checker = 1

" == Airline ==
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
""let g:airline_symbols.space = "\ua0"
" TODO: This might need to be conditional on osx or linux
""let g:airline_symbols.linenr = "= "

let g:airline_theme = "solarized"
let g:airline_solarized_bg = "dark"

" == CtrlP ==
let g:ctrlp_working_path_mode = 'ra'

" == Rust ==
let g:rustfmt_autosave = 1

" == C++ Syntax Highlighting ==
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

" == Scheme Autoformatting ==
let g:formatdef_custom_racket = '"scmindent.rkt"'
let g:formatters_racket = ['custom_racket']

" == Haskell ==
let g:haskell_classic_highlighting = 1
"let g:haskell_indent_disable = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_indent_if = 2
let g:haskell_indent_case = 2
let g:haskell_indent_let = 2
let g:haskell_indent_where = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 2
let g:haskell_indent_in = 2
let g:haskell_indent_guard = 2

" }}}

" == FileType Specific == {{{

" Vimscript file settings
augroup filetype_vim
    autocmd!
    " Set fold method to marker.
    " (With the implicit assumption that anyone editing a vimscript file is
    " using vim).
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" C & C++ file settings
let c_syntax_for_h = 1
let c_no_comment_fold = 1
augroup filetype_cpp
    autocmd!
    " fold by syntax
    autocmd Syntax c setlocal foldmethod=syntax
    autocmd Syntax c setlocal foldlevel=1
    " Run Autoformat on write.
    autocmd BufWritePre *.c,*.cpp,*.h,*.hpp :YcmCompleter Format
augroup END

" Racket file settings
"augroup filetype_racket
    "autocmd!
    " Run Autoformat on write.
    "autocmd BufWritePre *.rkt :Autoformat
"augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal textwidth=100
augroup END

" Haskell file settings
"augroup filetype_haskell
"    autocmd!
"    set tabstop=2
"    set shiftwidth=2
"    set softtabstop=2
"    set autoindent
"augroup END

" }}}

" == Misc == {{{

" Thoughtbot's fancy command completion function. (Thank you Thoughtbot).
"set wildmode=list:longest,list:full
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col -1] !~ '\k'
"        return "\<tab>"
"    else
"        return "<\c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <c-n>

" }}}

" == Rust Folding == {{{

augroup rust_folding
    autocmd!
    autocmd FileType rust call SetRustFold()
augroup END

function! SetRustFold()
    setlocal foldmethod=expr
    setlocal foldexpr=RustFold(v:lnum)
    setlocal foldlevel=1
endfunction

function! RustFold(lnum)
    let line = getline(a:lnum)

    " Doc comment
    if line =~? '\v^\s*\/{3}'
        return 2
    " Regular comment
    elseif line =~? '\v^\s*\/{2}'
        return 1
    else
        return 0
    endif
endfunction

" }}}
