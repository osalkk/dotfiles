" Plugin management with Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'                           " Standard vim defaults
Plugin 'tpope/vim-fugitive'                           " Git commands from vim
Plugin 'scrooloose/nerdtree'                          " Filesystem explorer
Plugin 'altercation/vim-colors-solarized'             " Solarized color scheme
Plugin 'djoshea/vim-autoread'                         " Autoread files changed outside the buffer
Plugin 'elzr/vim-json'                                " Better JSON for vim
Plugin 't9md/vim-chef'                                " Chef navigation
Plugin 'christoomey/vim-tmux-navigator'               " Tmux + Vim panel navigation seamlessly
Plugin 'tpope/vim-commentary'                         " Comment blocks of code
Plugin 'mattn/gist-vim'                               " Create gists from buffer
Plugin 'mattn/webapi-vim'                             " Interface to WEB APIs
Plugin 'tpope/surround'                               " Change surrondings
call vundle#end()
filetype plugin indent on
" END

" Personal configs
" Disable arrow keys... hjkl!!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

syntax on              " Enable syntax highlighting
set background=dark    " Selfexplanatory, ain't it?
colorscheme solarized  " Enable solarized colorscheme
set hlsearch           " Highlight matching searches
set ignorecase         " Well, ignore case...
set autoindent         " When pasting or opening brackets, try to audoindent
set shiftwidth=2       " How many columns text is indented with the reindent operations (<< and >>)
set softtabstop=2      " How many columns when you hit Tab in insert mode
set expandtab          " Use spaces instead of tabs when hitting Tab
set mouse=a            " Enable mouse interaction for all modes
set paste              " Disables things like word wrap and auto-indent
set splitright         " When opening new vertical buffers, open them on the right
set splitbelow         " Same but for horizontal
set number             " Set absolute number as the actual line
set relativenumber     " Set relative numbers
set showcmd            " Show commands always



" NERDTree Configuration "
" Open filesystem navigator if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Magenta', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('sh', 'Red', 'none', 'red', '#151515')

" Shortcuts
" Open filesystem tree navigation with Ctrl + N
map <C-n> :NERDTreeToggle<CR>

" Chef plugin config
map <C-g> :ChefFindAnyVsplit<CR>
map <C-b> :ChefFindAnySplit<CR>

