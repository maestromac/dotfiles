" vim-plug
call plug#begin('~/.vim/bundle')
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'craigemery/vim-autotag'
Plug 'djoshea/vim-autoread'
Plug 'galooshi/vim-import-js'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'ngmy/vim-rubocop'
Plug 'othree/yajs.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'w0rp/ale'
" retired plugings
" Plug 'joshdick/onedark.vim'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'vim-syntastic/syntastic'
" Plug 'thewtex/tmux-mem-cpu-load'
" Plug 'tpope/vim-bundler'
call plug#end()
" -------------------------------------------------------------------------------

" Misc setting
set cursorline
set splitright
set splitbelow
" -------------------------------------------------------------------------------

" Theme and Airline configuration
" colorscheme onedark
let g:seoul256_background = 238
colo seoul256

set encoding=UTF-8

set noshowmode
" let g:airline_theme='luna'
" let g:airline#extensions#tabline#enabled = 1
" air-line
" let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" Fix BCE
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


if !has('gui_running')
  set t_Co=256
endif
" -------------------------------------------------------------------------------

" Sensible default stuff
filetype plugin indent on
syntax on
" colorscheme onedark
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
set nocompatible
set number
set incsearch
set hlsearch
" -------------------------------------------------------------------------------

" syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers=['mri', 'rubocop']
" let g:syntastic_loc_list_height = 3

" Force all .js.erb to be treated as JavaScript
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.js.erb set filetype=javascript
augroup END

let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \}

"fold settings
" ------------
" toggle folding with za.
" fold everything with zM
" unfold everything with zR.
" zm and zr can be used too
" set foldmethod=syntax   "fold based on syntax (except for haml below)
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
let g:ruby_fold = 1
let g:javasScript_fold = 1
set foldmethod=syntax
set foldlevelstart=99

" -------------------------------------------------------------------------------

" Ack.vim setting (with ag instead of ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" -------------------------------------------------------------------------------

" custom leader and other mapping
let mapleader = ","
noremap <leader>f :tab split<CR>:Ack ""<Left>
noremap <leader>F :tab split<CR>:Ack <C-r><C-w><CR>
noremap <leader>v :!approvals verify<CR>
noremap <leader>w :w<cr>
noremap <leader>s :A<cr>
noremap <leader>q :q<cr>
noremap <leader><Tab> :wq<cr>
noremap <leader>3 :NERDTreeToggle<CR>
noremap <leader>ale :ALEFix<CR>
noremap <leader>n :NERDTreeFind<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>
inoremap jj <Esc>
nnoremap p p=`]
nnoremap <c-p> p
vnoremap // y/<C-R>"<CR>
" -------------------------------------------------------------------------------

" auto highlight trailing white spaces
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" -------------------------------------------------------------------------------

" auto-strip white spaces on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre *.js,*.rb,*.erb :call TrimWhiteSpace()
" -------------------------------------------------------------------------------

" auto-reload
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
" -------------------------------------------------------------------------------

" FZF stuff
set rtp+=~/.fzf
" nnoremap <C-p> :FZF<CR> THIS IS THE DEFAULT SETTING
nnoremap <C-p> :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
" This used to work with MacVim but it kind of break NeoVim
" nnoremap <C-p> :Files<CR>﻿
" -------------------------------------------------------------------------------

" NERDTree

let NERDTreeShowHidden=1
" -------------------------------------------------------------------------------

" NERDcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" -------------------------------------------------------------------------------

" YCM
" -------------------------------------------------------------------------------

" GIT
autocmd Filetype gitcommit setlocal spell textwidth=72
" -------------------------------------------------------------------------------

"  Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" -------------------------------------------------------------------------------

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>"
" let g:test#preserve_screen = 1
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}
let test#ruby#use_spring_binstub = 1
let test#ruby#rspec#options = {
  \ 'file':    '--format documentation',
\}
" -------------------------------------------------------------------------------
