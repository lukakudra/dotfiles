let mapleader = " "

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
" Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
" Plug 'ericbn/vim-solarized'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
call plug#end()

" Some basics:
    set nocompatible
    filetype plugin on
    syntax enable
    set encoding=utf-8
    set number
    " set termguicolors
    colorscheme gruvbox
    set background=dark
    " set clipboard=unnamedplus
    " set term=rxvt-unicode-256color
    " set term=xterm-256color

" Set colorscheme to match the one from the shell
    " if filereadable(expand("~/.vimrc_background"))
     " let base16colorspace=256
      " source ~/.vimrc_background
    " endif

" Mouse support:
    set mouse=a
    set ttymouse=xterm2

" Set tabs to 4 spaces:
    set tabstop=4
    set shiftwidth=4
    set expandtab

" CtrlP configuration:
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <leader>t :CtrlPTag<cr>
    
" Enable autocompletion:
    set wildmenu
    set wildmode=longest:full,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Gvim font settings:
    if has("gui_running")
        set guifont=Inconsolata\ 12
    endif

" fix tmux background color
    set t_Co=256

" Draw a line at 79 characters
    "let &colorcolumn=join(range(80, 999),",")
    "let &colorcolumn="79,".join(range(400, 999),",")

" Goyo plugin makes text more readable when writing prose:
    map <leader>g :Goyo \| set linebreak<CR>

" Splits open at the bottom and right:
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
    map <C-l> <C-w>l

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex

" Readmes autowrap text:
    autocmd BufRead,BufNewFile *.md set tw=79

" NerdTree configuration:
    nmap <F6> :NERDTreeToggle<CR>
    let NERDTreeQuitOnOpen=1
    map <leader>f :NERDTreeFind<cr>

" NerdCommenter config
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

" Navigating with guides
	"inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	"vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
    map <leader><leader> <Esc>/<++><Enter>"_c4l

" Change cursor shape in insert mode
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"

" Autocomplete with Ctrl + space
    if has("gui_running")
        " C-Space seems to work under gVim on both Linux and win32
        inoremap <C-Space> <C-n>
    else " no gui
      if has("unix")
        inoremap <Nul> <C-n>
      endif
    endif

" Surround selected text in visual mode with parentheses, double quotes and single quotes and select it again
    vnoremap ;( <ESC><ESC>`<i(<ESC>`>2li)<ESC>
    vnoremap ;" <ESC><ESC>`<i"<ESC>`>2li"<ESC>
    vnoremap ;' <ESC><ESC>`<i'<ESC>`>2li'<ESC>

" Copy to system clipboard
" * uses PRIMARY
" + usese CLIPBOARD
    noremap <Leader>y "+y
    noremap <Leader>p "+p
    noremap <Leader>Y "*y
    noremap <Leader>P "*p

""" CODE SNIPPETS      

"""LATEX
	" Word count:
	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
	autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ;ct \cite{}<++><Esc>T{i
	autocmd FileType tex inoremap ;foot \footnote{}<++><Esc>T{i
	autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ;li <Enter>\item<Space>
	autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA

"""HTML
	autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ;it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ;1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ;2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ;3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ;e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ;im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ;td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ;tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ;th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ;tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ;gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ;rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ;yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ;dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ;dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>
	autocmd FileType html inoremap á &aacute;
	autocmd FileType html inoremap é &eacute;
	autocmd FileType html inoremap í &iacute;
	autocmd FileType html inoremap ó &oacute;
	autocmd FileType html inoremap ú &uacute;
	autocmd FileType html inoremap ä &auml;
	autocmd FileType html inoremap ë &euml;
	autocmd FileType html inoremap ï &iuml;
	autocmd FileType html inoremap ö &ouml;
	autocmd FileType html inoremap ü &uuml;
	autocmd FileType html inoremap ã &atilde;
	autocmd FileType html inoremap ẽ &etilde;
	autocmd FileType html inoremap ĩ &itilde;
	autocmd FileType html inoremap õ &otilde;
	autocmd FileType html inoremap ũ &utilde;
	autocmd FileType html inoremap ñ &ntilde;
	autocmd FileType html inoremap à &agrave;
	autocmd FileType html inoremap è &egrave;
	autocmd FileType html inoremap ì &igrave;
	autocmd FileType html inoremap ò &ograve;
	autocmd FileType html inoremap ù &ugrave;


""".bib
	autocmd FileType bib inoremap ;a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ;b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ;c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
	autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ;c ```<cr>```<cr><cr><esc>2kO

""".xml
	autocmd FileType xml inoremap ;e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ;a <a href="<++>"><++></a><++><Esc>F"ci"


