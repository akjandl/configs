set number
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'joshdick/onedark.vim'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Set colorscheme
colorscheme onedark

if has('mouse')
  set mouse=a
endif

" remap <Leader> key (note: may not work in consoles! Default: \)
let mapleader=" "

"""" WINDOW MANAGEMENT """"

set wmh=0  " set stacked height to 0 by default
" fast resizing of windows
map <leader>=  <C-W>=
map <leader>-  <C-W>_

" sane and intuitive vim windows management
" http://www.agillo.net/simple-vim-window-management/
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())  " we havent moved
    if (match(a:key,'[jk]'))  " were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" moving around/creating splits
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

" closing & rotating splits
map <leader>wc :wincmd q<cr>
map <leader>wr <C-W>r

" moving windows
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

" resizing using arrow keys
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

" moving between buffers
map gn :bn<cr>
map gN :bp<cr>
map gd :bd<cr>
map gl :b#<cr>
map gb :buffers<cr>

" ALE Plugin configuration

let g:ale_linters = {'rust': ['rls', 'rustfmt']}
let g:ale_fixers = {'rust': ['rustfmt']}

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#0087ff', '#875fdf', '#df5fdf', '#df5f87'],
\	'ctermfgs': ['darkblue', 'darkcyan', 'darkmagenta', 'yellow'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['#0087ff', '#875fdf', '#df5fdf', '#df5f87'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

