"act similar to mswin applications, Control+C, Control+P, etc.
behave mswin

"its ok to not be vi compatibale
set nocompatible

"don't create ~filename backups, very annoying to leave this on and find dozens of extra files scattered about
set nobackup

"if xterm, assume color is OK
if &term =~ "xterm" || &term =~ "color"
	set t_Co=8
	"Tell vim it's ok to send color
	if &term =~ "xterm"
		set term=xterm-color
	endif

	"All around well balanced colorscheme
	colorscheme ron

	"For med-dark monitors 'ron' or 'koehler' colorschemes are great
	"colorscheme koehler
endif

"if terminal supports 256 coloring
if &term =~ "256color"
	"For bright monitors, 'ir-black' is nice to the eyes, enable 256 mode and set colorscheme to 'ir-black'
endif
"set t_Co=256
colorscheme delek

"Turn on syntax highlighting, this works regardless of color settings
syntax on

"enable the mouse & features
set mouse=a
set selectmode-=mouse "Use the mouse just like visual mode, so you can use vim commands on mouse selections, eg. 'x' to cut and 'y' to yank

"This is if you have a dark background in your terminal, light is another option
set background=dark
"set background=light


set backspace=2 "backspace works in insert mode, much more user-friendly
set expandtab
set tabstop=4 "set tab width to 4 spaces
set shiftwidth=4 "set (auto)tab's to width of 4 spaces
"Neither of the above actually puts spaces into a file when tabbing, they simply display 4 spaces when a \t is read
set ignorecase "ignore case when searching
set hlsearch "highlight searchs
set smartcase "override ignorecase if any search character is uppercase
set autoindent "turn on auto indent
set nosmartindent "turn off smart indent (fixes comments in python)
set number "show line numbers
"set nowrap "don't wrap lines longer than the screen's width
set guioptions+=b "show bottom scrollbar when in gvim
set foldmethod=indent "fold code based on indents
set nofoldenable "makes sure the code is not folded when first opened, used zi to toggle
set ruler "Show line statistics in bottom left corner
set scrolloff=4 "Keep 4 lines at minimum above & below the cursor when scrolling around a file

"These options are personal preference
"set cursorline "Underline the current line the cursor is on.
"set incsearch "highlight search matches as typed, may jar your mind while jumping around the file

"Upgrade the status line to give more usefull information
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P
set laststatus=2 "Make statusline always on
set cmdheight=2 "default command line number of lines, 2 makes it easier to read

"Printing (:hardcopy) options
set printoptions=paper:letter,syntax:y,number:y,duplex:off,left:5pc

"Enable filetype's
filetype on
filetype indent on
filetype plugin on

"Highlight MakeKitBuild files as though they were shell scripts
au BufNewFile,BufRead MakeKitBuild set filetype=sh

"Wrap visual selections with chars
:vnoremap ( "zdi(<C-R>z)<ESC>
:vnoremap { "zdi{<C-R>z}<ESC>
:vnoremap [ "zdi[<C-R>z]<ESC>
:vnoremap ' "zdi'<C-R>z'<ESC>
:vnoremap " "zdi"<C-R>z"<ESC>

"If your having trouble with the backspace character, try uncommenting these
"imap <C-?> <BS>
"imap <C-H> <BS>
"inoremap <BS>

"Map CTRL+<Arrow> to move up/down half a page
:map <C-Up> <C-u>
:map <C-Down> <C-d>

if has("autocmd")
    " Have Vim jump to the last position when reopening a file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif

	" Support mips.asm files
	autocmd BufNewFile,BufRead *.mips.asm set syntax=mips.vim

    " Trim Trailing white space on general files
    autocmd FileType c,cpp,java,php,js,css,xml,xsl,s autocmd BufWritePre * :%s/[ \t\r]\+$//e
endif

" Start pathogen, a runtime path manager
execute pathogen#infect()

set tags=tags;/
set cursorline

" Add a paste mode, so that vim won't destroy indentation
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
