"
"   This is the personal .vimrc file of wanglk.
"   You can find me at https://github.com/wlk1204/wlk1204-vim
"

" ==========
" Environment
" ==========
  silent function! OSX()
      return has('macunix')
  endfunction
  silent function! LINUX()
      return has('unix') && !has('macunix') && !has('win32unix')
  endfunction
  silent function! WINDOWS()
      return  (has('win32') || has('win64'))
  endfunction

" ==========
" Windows Compatible
" ==========
  set nocompatible  " Must be first line

  if !WINDOWS()
      set shell=/bin/sh
  endif
  if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  endif

" ==========
" GUI Settings
" ==========
  if has('gui_running')
      set guioptions-=T           " Remove the toolbar
      set lines=40                " 40 lines of text instead of 24
      if LINUX() && has("gui_running")
          set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
      elseif OSX() && has("gui_running")
          set guifont=HackNerdFontComplete-Regular:h14,Menlo\ Regular:h14,Consolas\ Regular:h14,Courier\ New\ Regular:h14
      elseif WINDOWS() && has("gui_running")
          set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
      endif
  else
      if &term == 'xterm' || &term == 'screen'
          set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
      endif
  endif

" ==========
" Plugins
" ==========

  if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'                            " 目录
  Plug 'ryanoasis/vim-devicons'                         " icon
  Plug 'editorconfig/editorconfig-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-surround'                             " 边界操作
  Plug 'scrooloose/nerdcommenter'                       " 自动注释
  Plug 'mattn/emmet-vim'                                " 代码补全
  Plug 'raimondi/delimitMate'                           " 自动完成括号、引号
  Plug 'vim-airline/vim-airline'                        " 底部菜单
  Plug 'easymotion/vim-easymotion'                      " 快速移动
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }    " space 提示键
  Plug 'ctrlpvim/ctrlp.vim'                             " 搜索文件
  Plug 'terryma/vim-multiple-cursors'                   " 单词多选
  Plug 'leafgarland/typescript-vim'                     " 支持 ts 文件
  Plug 'peitalin/vim-jsx-typescript'                    " React JSX 代码高亮
  Plug 'junegunn/fzf'                                   " 目录内搜索
  Plug 'junegunn/fzf.vim'
  Plug 'psliwka/vim-smoothie'                           " 窗口平滑移动
  Plug 'kristijanhusak/vim-carbon-now-sh'               " carbon 截图
  Plug 'KeitaNakamura/neodark.vim'                      " 主题
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-solarized8'
  Plug 'joshdick/onedark.vim'

  call plug#end()

" ==========
" General
" ==========
  set noswapfile                      " no swap files
  set noundofile                      " no undo files
  set nobackup                        " no backup files
  set nowritebackup                   " only in case you don't want a backup file while editing
  set mouse=a                         " Automatically enable mouse usage
  set mousehide                       " Hide the mouse cursor while typing
  set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  set virtualedit=onemore             " Allow for cursor beyond last character
  set history=1000                    " Store a ton of history (default is 20)
  set nospell                         " Spell checking on
  set hidden                          " Allow buffer switching without saving
  set clipboard^=unnamed,unnamedplus  " Cross-platform value for copy-paste

" ==========
" Formatting
" ==========
  set encoding=utf8
  set nowrap                          " Do not wrap long lines
  set autoindent                      " Indent at the same level of the previous line
  set shiftwidth=2                    " Use indents of 2 spaces
  set expandtab                       " Tabs are spaces, not tabs
  set tabstop=2                       " An indentation every four columns
  set softtabstop=2                   " Let backspace delete indent
  set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
  set splitright                      " Puts new vsplit windows to the right of the current
  set splitbelow                      " Puts new split windows to the bottom of the current
  set pastetoggle=<F12>               " pastetoggle (sane indentation on pastes)
  set comments=sl:/*,mb:*,elx:*/      " auto format comment blocks
  filetype plugin indent on           " Automatically detect file types.
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  scriptencoding utf-8

" ==========
" Vim UI
" ==========
  let g:onedark_terminal_italics = 1 " 斜体
  " let g:onedark_hide_endofbuffer = 1 " 隐藏结尾 ’～‘ 符号
  let g:airline_theme='onedark'

  syntax on
  " solarized gruvbox neodark onedark
  colorscheme onedark
  " let g:neodark#background = '#202020'
  set background=dark
  set termguicolors

  " 隐藏结尾 ’～‘ 符号
  highlight EndOfBuffer ctermfg=bg guifg=bg
  highlight clear SignColumn
  highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
  set tabpagemax=15               " Only show 15 tabs
  set showmode                    " Display the current mode
  set cursorline                  " Highlight current line
  set backspace=indent,eol,start  " Backspace for dummies
  set linespace=0                 " No extra spaces between rows
  set nonumber                    " not show current line number
  set showmatch                   " Show matching brackets/parenthesis
  set incsearch                   " Find as you type search
  set hlsearch                    " Highlight search terms
  set winminheight=0              " Windows can be 0 line high
  set ignorecase                  " Case insensitive search
  set smartcase                   " Case sensitive when uc present
  set wildmenu                    " Show list instead of just completing
  set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
  set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
  set scrolljump=5                " Lines to scroll when cursor leaves screen
  set scrolloff=3                 " Minimum lines to keep above and below cursor
  set sidescrolloff=15
  set foldenable                  " Auto fold code
  set foldmethod=marker
  set list
  set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
  " set relativenumber            " Show relative line numbers 注释掉不显示行号
  if has('cmdline_info')
      set ruler                   " Show the ruler
      set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
      set showcmd                 " Show partial commands in status line and
  endif

" ==========
" Key(re) Mappings
" ==========
  let mapleader = ' '
  let maplocalleader = '_'
  let s:edit_config_mapping = '<leader>ev'
  let s:apply_config_mapping = '<leader>sv'
  noremap j gj
  noremap k gk
  nnoremap Y y$
  noremap <leader>bg :call ToggleBG()<CR>

  " window
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_
  map <leader>d <C-d>
  map <leader>u <C-u>
  map <leader>r <C-r>

  " buffer
  nnoremap <Leader>bl :ls<CR>
  nnoremap <Leader>bp :bp<CR>
  nnoremap <Leader>bn :bn<CR>
  for i in range(1, 30)
    execute "nnoremap <Leader>b" . i . " :" . i . "b<CR>"
  endfor
  execute "nnoremap <Leader>vs :vs<CR>"
  execute "nnoremap <Leader>bd :bd<CR>"

 " Adjust viewports to the same size
  map <Leader>= <C-w>=

  " Easier horizontal scrolling
  map zl zL
  map zh zH
  nmap <silent> <leader>/ :set invhlsearch<CR>

  " Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to
  nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
  vnoremap < <gv
  vnoremap > >gv

  " repeat operator http://stackoverflow.com/a/8064607/127816
  vnoremap . :normal .<CR>

" ==========
" Plugin Settings
" ==========
  " ctrlp
  let g:ctrlp_map = '<leader>p'

  " whichkey
  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

  " delimitMate
  let g:delimitMate_expand_cr = 1            " auto indent

  " NERD Commenter
  let g:NERDCreateDefaultMappings = 1
  let g:NERDSpaceDelims=1
  " let g:NERDCustomDelimiters = { 'typescript.tsx': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' } }

  " NERDTree
  let NERDTreeShowHidden=1                   " show hidden files
  let NERDTreeQuitOnOpen=0
  let NERDTreeMinimalUI = 1                  " disable that old “Press ? for help”
  let NERDTreeAutoDeleteBuffer = 1           " https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9
  let NERDTreeDirArrowExpandable = "\u00a0"  " NERDTree remove arrow
  let NERDTreeDirArrowCollapsible = "\u00a0"
  let NERDTreeNodeDelimiter = "\x07"
  let g:DevIconsEnableFoldersOpenClose = 1
  map <leader>1 <C-h>
  map <leader>2 <C-l>
  map <C-e> :NERDTreeToggle<CR>
  map <leader>e :NERDTreeFind<CR>

  " NERDTree 隐藏尾部文件斜杠
  augroup nerdtreehidetirslashes
    autocmd!
    autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
  augroup end

  " 重新加载 .vimrc 时刷新 webdevicon
  if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
  endif

  " airline
  let g:airline#extensions#tabline#enabled = 0        " tabline enabled 1 显示 0 隐藏
  let g:airline#extensions#tabline#fnamemod = ':t'    " only show filename
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " coc 映射
  nmap <silent> <Leader>gd <Plug>(coc-definition)
  nmap <silent> <Leader>jne <Plug>(coc-diagnostic-next-error)
  nmap <silent> <Leader>jpe <Plug>(coc-diagnostic-prev-error)
  nmap <silent> <Leader>jnw <Plug>(coc-diagnostic-next)
  nmap <silent> <Leader>jpw <Plug>(coc-diagnostic-prev)

  " coc.vim 用 tab 键触发补全
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

  " carbon 插件快捷键
  vnoremap <F5> :CarbonNowSh<CR>

" ==========
" 功能函数
" ==========
  " 更换背景色
  function! ToggleBG()
      let s:tbg = &background
      if s:tbg == "dark"
          set background=light
      else
          set background=dark
      endif
  endfunction

  " 检查行尾空格
  function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " 窗口加标号
  if !exists('*WindowNumber')
    function! WindowNumber(...)
      let builder = a:1
      let context = a:2
      call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
      return 0
    endfunction
    call airline#add_statusline_func('WindowNumber')
    call airline#add_inactive_statusline_func('WindowNumber')
  endif

  function! s:ExpandFilenameAndExecute(command, file)
      execute a:command . " " . expand(a:file, ":p")
  endfunction

  " 编辑 .vimrc
  function! s:EditVimrcConfig()
      call <SID>ExpandFilenameAndExecute("tabedit", "~/.vimrc")
  endfunction

  execute "noremap " . s:edit_config_mapping " :call <SID>EditVimrcConfig()<CR>"
  execute "noremap " . s:apply_config_mapping . " :source ~/.vimrc<CR>"
