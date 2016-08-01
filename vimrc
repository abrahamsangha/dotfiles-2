set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kien/ctrlp.vim'
Bundle 'https://github.com/vim-ruby/vim-ruby'
Bundle 'https://github.com/vim-scripts/ruby-matchit'
Bundle 'https://github.com/mattn/emmet-vim'
Bundle 'https://github.com/gregsexton/MatchTag'
Bundle "https://github.com/vim-scripts/VimClojure"
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle "https://github.com/tpope/vim-fugitive"
Bundle "https://github.com/tpope/vim-fireplace"
Bundle "https://github.com/kchmck/vim-coffee-script"
Bundle "https://github.com/slim-template/vim-slim"
Bundle "https://github.com/nelstrom/vim-visual-star-search"
Bundle 'benmills/vimux'
Bundle 'https://github.com/elixir-lang/vim-elixir'
Bundle 'rizzatti/dash.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'digitaltoad/vim-jade'
Bundle 'amdt/vim-niji'
Bundle 'https://github.com/vim-scripts/paredit.vim'
Bundle 'fatih/vim-go'
Bundle 'tpope/vim-commentary'
Bundle 'https://github.com/mxw/vim-jsx'
Bundle 'rust-lang/rust.vim'
Bundle 'https://github.com/lambdatoast/elm.vim'
Bundle 'https://github.com/FelikZ/ctrlp-py-matcher'
Bundle 'https://github.com/xolox/vim-misc'
Bundle 'https://github.com/xolox/vim-easytags'
Bundle 'https://github.com/tpope/vim-surround'
Bundle 'https://github.com/tpope/vim-repeat'
Bundle 'godlygeek/tabular'

filetype plugin indent on
syntax on
filetype detect

autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
autocmd BufRead,BufNewFile *.clj setlocal filetype=clojure
autocmd BufRead,BufNewFile *.hiccup setlocal filetype=clojure

runtime macros/matchit.vim

let vimclojure#HightlightBuiltins=1
let vimclojure#ParenRainbow=1

let g:paredit_matchlines=200
let g:paredit_mode=1
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_working_path_mode = 'ra'
let NERDTreeShowHidden=1

let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm2"
let g:easytags_async=1

set backspace=indent,eol,start
set nocompatible
set ruler
set wildmenu
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set showcmd
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set nobackup
set noswapfile
set number
set numberwidth=5
set list
set listchars=tab:>-,trail:.
set ignorecase
set smartcase
set nowrap
set completeopt=longest,menu
set wildmode=list:longest,list:full

:command W w

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Autoremove trailing spaces when saving the buffer
autocmd FileType c,cpp,clj,eruby,html,java,javascript,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

let &t_Co=256
colorscheme tomorrow-night

autocmd BufWritePre * :%s/\s\+$//e

let mapleader = ","

map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j
map <C-K> <C-W>k

map <C-n> :NERDTreeToggle<CR>

if filereadable(".vimrc.local")
  source .vimrc.local
endif

"Rspec.vim mappings
map <Leader>. :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set splitbelow
set splitright

"Correctly indent Lisp (Dorai Sitaram)
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

" Vimux
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <Leader>vs vip<Leader>vs<CR>

" Open a runner pane and start the Racket REPL
nmap <Leader>rr :call Sicp()<CR>

function! Sicp()
  call VimuxRunCommand("rrepl")
endfunction

" run current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; srs " . bufname("%"))<CR>

" Run last vimux command
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close runner pane
map <Leader>vx :VimuxCloseRunner<CR>

" Interrupt runner pane
map <Leader>vq :VimuxInterruptRunner<CR>

" Open runner pane
map <Leader>vo :call VimuxOpenPane()<CR>

" Prompt for a command to run
map <Leader>vc :call VimuxPromptCommand()<CR>

" vim-commentary for ruby
autocmd FileType ruby set commentstring=#\ %s

