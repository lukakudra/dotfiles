" vim-plug

call plug#begin(stdpath('data') . '/plugged')
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug '/usr/bin/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
	Plug 'vim-scripts/auto-pairs-gentle'
    Plug 'junegunn/goyo.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'lervag/vimtex'
    Plug 'rhysd/vim-clang-format'
    Plug 'morhetz/gruvbox'
call plug#end()

" HOWTOs:

" Tag jumping
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" Autocomplete (documented in |ins-completion|)
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" COMMON SETTINGS:
let mapleader=","
set nocompatible
syntax enable
filetype plugin on
set encoding=utf-8
set number
set termguicolors
colorscheme gruvbox
set background=dark

set noundofile
set noswapfile
set nobackup

set mouse=a

set tabstop=4
set shiftwidth=4
set expandtab

set path+=**
set wildmenu
set wildmode=longest:full,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right:
set splitbelow splitright

" fix tmux background color
" set t_Co=256

" Navigating with guides
" inoremap <leader><leader> <Esc>/<Enter>"_c4l
" vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
" map <leader><leader> <Esc>/<++><Enter>"_c4l

" Surround selected text in visual mode with characters that come in pairs
vnoremap ;( <ESC><ESC>`<i(<ESC>`>2li)<ESC>
vnoremap ;" <ESC><ESC>`<i"<ESC>`>2li"<ESC>
vnoremap ;' <ESC><ESC>`<i'<ESC>`>2li'<ESC>
vnoremap ;[ <ESC><ESC>`<i[<ESC>`>2li]<ESC>
vnoremap ;{ <ESC><ESC>`<i{<ESC>`>2li}<ESC>

" Copy to system clipboard
" * uses PRIMARY
" + usese CLIPBOARD
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

" Remember position in file
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" PLUGINS:

" Fugitive configuration
set diffopt+=vertical
nnoremap <leader>d :Gdiffsplit!<cr>

" Fzf configuration
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files --no-ignore-vcs'
nnoremap <leader>, :Files<cr>
nnoremap <leader>t :Tags<cr>

" Vim-Go configuration
" Run go imports when saving go files
let g:go_fmt_command = "goimports"

" Gentle auto pairs
let g:AutoPairsUseInsertedCount = 1

" Latex
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'

" Goyo plugin makes text more readable when writing prose:
map <leader>g :Goyo \| set linebreak<CR>

" NerdTree configuration:
nmap <C-M-b> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=0
nmap <leader>v :NERDTreeFind<CR>
" autocmd BufWinEnter * NERDTreeMirror
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize=60

" NerdCommenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Change default delimiters for C
let g:NERDAltDelims_c = 1

" Lightline
set noshowmode
let g:lightline = {'colorscheme' : 'gruvbox'}

" Clang-format
let g:clang_format#detect_style_file = 1
let g:clang_format#code_style = 'llvm'
let g:clang_format#auto_format = 1

" SNIPPETS:
" TO DO

" COC CONFIG:

" coc extensions
let g:coc_global_extensions = [
    \'coc-snippets',
    \'coc-json',
    \'coc-html',
    \'coc-css',
    \'coc-yaml',
    \'coc-python',
    \'coc-markdownlint',
    \'coc-go',
    \'coc-vimtex',
    \'coc-tsserver'
    \]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Do not use <TAB>, it conflicts with default vim bindings (<C-i> is the same as <TAB>)
" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

