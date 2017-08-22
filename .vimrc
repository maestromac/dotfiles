" vim-plug
call plug#begin('~/.vim/bundle')
Plug 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-bundler'
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'thewtex/tmux-mem-cpu-load'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'w0rp/ale'
call plug#end()
"let see if I will see this line
" -------------------------------------------------------------------------------

" Theme and lightline configuration
colorscheme onedark

set noshowmode

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
" -------------------------------------------------------------------------------

" Sensible default stuff
filetype plugin indent on
syntax on
colorscheme onedark
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
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader><Tab> :wq<cr>
noremap <leader>3 :NERDTreeToggle<CR>
vnoremap <C-c> :w !pbcopy<CR><CR>
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

" FZF stuff
set rtp+=~/.fzf
nnoremap <C-p> :FZF<CR>
" This used to work with MacVim but it kind of break NeoVim
" nnoremap <C-p> :Files<CR>﻿
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
