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
"Plugin 'kien/rainbow_parentheses.vim'
" Surrounding braces
Plugin 'tpope/vim-surround'

" Statusline.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Better folding
Plugin 'konfekt/fastfold'

" Filebrowser.
Plugin 'scrooloose/nerdtree'

" Commenting
Plugin 'scrooloose/nerdcommenter'

" Fuzzy file finder.
"Plugin 'kien/ctrlp.vim'

" Formatting
"Plugin 'chiel92/vim-autoformat'

" == Completion ==

" Realtime completion.
 Plugin 'Valloric/YouCompleteMe'

" == Syntax ==

" Syntax highlighting.
Plugin 'scrooloose/syntastic'

" == Language ==

" Rust
Plugin 'rust-lang/rust.vim'

" GLSL
Plugin 'tikhomirov/vim-glsl'

" TOML
Plugin 'cespare/vim-toml'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Javascript
Plugin 'pangloss/vim-javascript'

" HTML
Plugin 'othree/html5.vim'

" PHP
"
" TODO: phpcomplete fucked with what im assuming were the powerline fonts or the
"       statusline.
"Plugin 'shawncplus/phpcomplete.vim'
Plugin 'stanangeloff/php.vim'

" Racket
"Plugin 'wlangstroth/vim-racket'

" Haskell
"Plugin 'neovimhaskell/haskell-vim'
"Plugin 'alx741/vim-hindent'

" Kotlin
"Plugin 'udalov/kotlin-vim'

" 6502 Assembly
Plugin 'maxbane/vim-asm_ca65'

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

set nottybuiltin

" Indentation
" set cindent
set cinoptions=
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

" for some reason, reloading vimrc without a guard on THIS option, breaks
" airline.... huh.
if !exists('b:did_hlsearch')
    " Enable search highlighting.
    set hlsearch
let b:did_hlsearch=1
endif

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

" Folding settings
set foldcolumn=1
"set foldlevelstart=0

" Distinguish the character limit with a colored column.
set colorcolumn=+1

" Optimize for fast terminal connections.
set ttyfast

" Enable mouse with urxvt mode.
set mouse=a
"set ttymouse=xterm2

" Pane splitting settings.
" set diffopt complained on macOS.
"set diffopt+=vertical
set splitbelow
set splitright

" Command timeouts.
set timeoutlen=1000
set ttimeoutlen=0

set completepopup=border:off,align:item

hi Todo cterm=bold ctermfg=13
hi Error cterm=bold ctermfg=9

" }}}

" == Key Mappings == {{{

function! ToggleLocList()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
endfunction

" Instead of setting mapleader to <Space>, map <Space> to <leader>.
" This way it will pop up in the showcmd corner. (Thank you /u/pandubear).
map <Space> <leader>

" Clear highlighting.
" nnoremap <leader>c :nohl<CR>

" When in visual mode, execute . as a normal mode command.
vnoremap . :norm.<CR>

" Window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Convenience mappings
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>p :CtrlP<CR>
"nnoremap <leader>t :TagbarToggle<CR>

nnoremap <leader>f :YcmCompleter FixIt<CR>
nnoremap <leader>y :YcmCompleter<Space>
nnoremap <leader>t :YcmCompleter GetType<CR>

nnoremap <leader>go :YcmCompleter GoToDocumentOutline<CR>
nnoremap <leader>gg :vertical YcmCompleter GoTo<CR>
nnoremap <leader>gh :vertical YcmCompleter GoToAlternateFile<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gc :vertical YcmCompleter GoToCallers<CR>
nnoremap <leader>r :YcmCompleter RefactorRename<space>
nnoremap <leader>i <Plug>(YCMToggleInlayHints)
nnoremap <leader>l :YcmDiags<CR>
nnoremap <leader>- :call ToggleLocList()<CR>

nnoremap <leader>/ :YcmForceCompileAndDiagnostics<CR>

nnoremap <leader>h <Plug>(YCMHover)
nnoremap <leader>sw <Plug>(YCMFindSymbolInWorkspace)
nnoremap <leader>sf <Plug>(YCMFindSymbolInDocument)

" fix and loc
"
nnoremap <leader>q :cwindow<CR>

" buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bsn :vert sbn<CR>
nnoremap <leader>bsp :vert sbp<CR>

" folding
nnoremap <leader>a za
nnoremap <leader>A zA

" convenience for creating highlight rules
function GetSyntax()
    return synIDattr(synID(line("."), col("."), 1), "name")
endfunction

function GetTextProp()
    let l:plist = prop_list(line('.'))
    for prop in l:plist
        let l:startcol = prop.col
        let l:endcol = l:startcol + prop.length
        let l:curcol = col('.')
        if curcol >= startcol && curcol < endcol
            return prop.type
        endif
    endfor
    return ""
endfunction

function ShowSynAndText()
    let l:synval = GetSyntax()
    let l:propval = GetTextProp()

    if len(synval) > 0
        echo synval
    endif
    if len(propval) > 0
        echo propval
    endif
endfunction

nnoremap <leader>ss :call ShowSynAndText()<CR>
nnoremap <leader>sr :so $MYVIMRC<CR>

" }}}

" == Plugin Settings == {{{

" == YouCompleteMe ==
let g:ycm_confirm_extra_conf = 0

let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'
let g:ycm_clangd_args = ["--header-insertion=never"]

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']

"let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_add_preview_to_completeopt = 'popup'
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = {'cpp': ['_']}

let g:ycm_update_diagnostics_in_insert_mode = 1
let g:ycm_show_detailed_diag_in_popup = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1

let g:ycm_enable_semantic_highlighting = 1

let g:ycm_enable_inlay_hint = 1
let g:ycm_clear_inlay_hints_in_insert_mode = 0

let g:ycm_goto_buffer_command = 'split-or-existing-window'

let &t_Cs = "\e[4:3m"

hi YcmErrorSection cterm=undercurl ctermul=1
hi YcmWarningSection cterm=undercurl ctermul=13

" == Rainbow Parens ==
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadChevrons

" == nerdcommenter ==
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCommentWholeLinesInVMode = 1
let g:NERDSpaceDelims = 1

" == Statusline ==
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"set statusline+=%{fugitive#statusline()}

" == Syntastic ==
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
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
"let g:airline_symbols.space = '\ua0'
" TODO: This might need to be conditional on osx or linux
"let g:airline_symbols.linenr = '= '

let g:airline_theme = "solarized"
let g:airline_solarized_bg = "dark"

" == CtrlP ==
let g:ctrlp_working_path_mode = 'ra'

" == Rust ==
let g:rustfmt_autosave = 1

" == FastFold ==
"let g:fastfold_force = 1
let g:fastfold_minlines = 0

" == C++ Syntax Highlighting ==
if (!g:ycm_enable_semantic_highlighting)
    let g:cpp_class_scope_highlight = 1
    let g:cpp_class_decl_highlight = 1
    let g:cpp_member_variable_highlight = 1
    "let g:cpp_experimental_template_highlight = 1
    "let g:cpp_experimental_simple_template_highlight = 1
    let g:cpp_posix_standard = 1
    let g:cpp_concepts_highlight = 1
endif

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

" == C++ semantic highlighting {{{

hi def link lsp_type Normal
hi def link lsp_class Normal
hi def link lsp_enum Normal
hi def link lsp_interface Normal
hi def link lsp_struct Normal
hi def link lsp_typeParameter Normal
hi def link lsp_parameter Normal
hi def link lsp_variable Normal
hi def link lsp_property Normal
hi def link lsp_enumMember Normal
hi def link lsp_event Normal
hi def link lsp_function Normal
hi def link lsp_method Normal
hi def link lsp_macro Normal
hi def link lsp_keyword Normal
hi def link lsp_modifier Normal
hi def link lsp_comment Normal
hi def link lsp_string Normal
hi def link lsp_number Normal
hi def link lsp_regexp Normal
hi def link lsp_operator Normal
hi def link lsp_concept Normal
hi def link lsp_namespace Normal
hi def link lsp_bracket Normal

let YCM_LSP_HIGHLIGHTS = [
            \'type',
            \'class',
            \'enum',
            \'interface',
            \'struct',
            \'typeParameter',
            \'parameter',
            \'variable',
            \'property',
            \'enumMember',
            \'event',
            \'function',
            \'method',
            \'macro',
            \'keyword',
            \'modifier',
            \'comment',
            \'string',
            \'number',
            \'regexp',
            \'operator',
            \'concept',
            \'namespace',
            \'bracket',]

if !exists('g:loaded_lsp_groups')
    for token_type in YCM_LSP_HIGHLIGHTS
        call prop_type_add('YCM_HL_'.token_type, {'highlight':'lsp_'.token_type})
    endfor
    let g:loaded_lsp_groups = 1
endif

function SetupCppSyntax()
    syntax keyword cppConcept concept requires
    hi link cppConcept Statement
    "hi link cppTemplate Statement

    "syntax keyword cppStruct class namespace
    "hi link cppStruct Structure
    "syntax keyword cppTypename typename
    "hi link cppTypename BaseType
endfunction

function SetupCppHighlight()
    call SetupCppSyntax()

    hi! sYellow ctermfg=3
    hi! sOrange ctermfg=9
    hi! sRed ctermfg=1
    hi! sMagenta ctermfg=5
    hi! sViolet ctermfg=13
    hi! sBlue ctermfg=4
    hi! sCyan ctermfg=6
    hi! sGreen ctermfg=2

    hi! sBase1 ctermfg=14 " emphasis
    hi! sBase01 ctermfg=10 " comments
    hi! sBase0 ctermfg=12 " normal

    hi! lsp_concept cterm=italic,bold ctermfg=4
    hi! lsp_property ctermfg=12 cterm=bold
    hi! lsp_parameter ctermfg=14
    hi! lsp_typeParameter ctermfg=13 cterm=bold
    hi! lsp_enumMember ctermfg=6 cterm=italic

    hi! BaseType ctermfg=3 cterm=italic
    hi link cType BaseType

    hi link lsp_macro Special
    hi link lsp_type BaseType
    hi link lsp_class Type
    hi link lsp_enum Type
    hi link lsp_struct Type
    hi link lsp_function Function
    hi link lsp_method Function
    hi lsp_namespace ctermfg=6
    hi lsp_bracket ctermfg=14

    hi! Structure ctermfg=3
    hi! StorageClass ctermfg=9
    hi! cppAccess ctermfg=2 cterm=bold
    hi link cppModifier StorageClass

    hi cppSTLexception ctermfg=2 cterm=nocombine
endfunction

" }}}

" == FileType Specific == {{{

function LocalClangFormat()
    if &modified
        let cursor_pos = getpos('.')
        :%!clang-format
        call setpos('.', cursor_pos)
    endif
endfunction

function OtherClangFormat()
    let l:formatdiff = 1
    py3f /opt/homebrew/opt/llvm/share/clang/clang-format.py
endfunction

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
"let c_no_comment_fold = 1
augroup filetype_cpp
    autocmd!
    " fold by syntax
    autocmd FileType c,cpp setlocal foldmethod=syntax
    "autocmd FileType c,cpp setlocal foldlevelstart=2
    autocmd FileType cpp call SetupCppHighlight()
    " Run Autoformat on write.
    autocmd BufWritePre *.c,*.cpp,*.h,*.hpp :YcmCompleter Format
augroup END

" Python file settings
augroup filetype_python
    autocmd!
    autocmd Syntax python setlocal foldmethod=indent
augroup END

" glsl file settings
augroup filetype_glsl
    autocmd!
    autocmd BufWritePre *.vert,*.frag,*.geom,*.comp :call LocalClangFormat()
augroup END

" Racket file settings
"augroup filetype_racket
    "autocmd!
    " Run Autoformat on write.
    "autocmd BufWritePre *.rkt :Autoformat
"augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal textwidth=80
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html setlocal textwidth=0
    autocmd FileType html setlocal tabstop=2
    autocmd FileType html setlocal shiftwidth=2
    autocmd FileType html setlocal softtabstop=2
    autocmd FileType html setlocal autoindent
augroup END

augroup filetype_php
    autocmd!
    autocmd FileType php setlocal textwidth=0
    autocmd FileType php setlocal tabstop=2
    autocmd FileType php setlocal shiftwidth=2
    autocmd FileType php setlocal softtabstop=2
    autocmd FileType php setlocal autoindent
augroup END

augroup filetype_toml
    autocmd!
    autocmd BufNewFile,BufRead *.toml.in setlocal filetype=toml
augroup END

function LocalJSONFormat()
    if &modified
        let cursor_pos = getpos('.')
        let l:input = join(getline(1, '$'), "\n")
        let l:output = systemlist('jq', l:input)
        if v:shell_error == 0
            call setline(1, l:output)
            if line('$') > len(l:output)
                execute (len(l:output)+1) . ',$delete _'
            endif
            call setloclist(0, [])
            lclose
        else
            let l:items = []
            for l:msg in l:output
                let l:m = matchlist(l:msg, 'line \(\d\+\), column \(\d\+\)')
                if len(l:m) >= 3
                    call add(l:items, {
                        \ 'bufnr': bufnr('%'),
                        \ 'lnum': str2nr(l:m[1]),
                        \ 'col':  str2nr(l:m[2]),
                        \ 'text': l:msg,
                        \ 'type': 'E'
                        \ })
                    let l:cursor_pos[1] = str2nr(l:m[1])
                    let l:cursor_pos[2] = str2nr(l:m[2])
                else
                    call add(l:items, {
                        \ 'bufnr': bufnr('%'),
                        \ 'lnum': 1,
                        \ 'col':  1,
                        \ 'text': l:msg,
                        \ 'type': 'E'
                        \ })
                endif
            endfor

            if empty(l:items)
                call add(l:items, {
                      \ 'bufnr': bufnr('%'),
                      \ 'lnum': 1,
                      \ 'col':  1,
                      \ 'text': 'jq failed (no stderr captured)',
                      \ 'type': 'E'
                      \ })
            endif

            " Replace loclist and open it (bottom), keep buffer unchanged
            call setloclist(0, l:items, 'r')
            lopen 1
        endif

        call setpos('.', cursor_pos)
    endif
endfunction

augroup filetype_json
    autocmd!
    autocmd FileType json autocmd BufWritePre <buffer> call LocalJSONFormat()
augroup END


" Recognize *.s and *.inc as 6502 assembly files
"augroup filetype_ca65
    "autocmd BufNewFile,BufRead *.s,*.inc setlocal filetype=asm_ca65
"augroup END

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

