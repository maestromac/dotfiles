" vim-plug
call plug#begin('~/.vim/bundle')
Plug 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-bundler'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
call plug#end()
" -------------------------------------------------------------------------------

" Theme
colorscheme onedark
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_loc_list_height = 3
" -------------------------------------------------------------------------------

" Ack.vim setting (with ag instead of ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" -------------------------------------------------------------------------------

" custom leader mapping
let mapleader = ","
noremap <leader>f :Ack<space>""<Left>
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader><Tab> :wq<cr>
noremap <leader>3 :NERDTreeTabsToggle<CR>
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

" FZF stuff
set rtp+=~/.fzf
nnoremap <C-p> :Files<CR>﻿
" -------------------------------------------------------------------------------

