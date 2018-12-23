" set pathogen
execute pathogen#infect()

" specif conf
set cmdheight=2
let python_highlight_all=1

" specific theme for vim
set background=dark
let g:hybrid_transparent_background = 1
let g:enable_italic_font = 1
colorscheme hybrid_material

" config of synstatic plugin
" With my config for having a list of errors, for example
" in a python. You have to type :Errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_enable_signs = 0
let g:syntastic_auto_loc_list = 0 
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" config of lightline plugin
set laststatus=2
set noshowmode
let g:lightline = {
	\			'colorscheme': 'jellybeans',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" sepcify conf for my favorites languages
filetype plugin on
