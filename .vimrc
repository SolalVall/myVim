" set pathogen
execute pathogen#infect()

" specif conf
set cmdheight=2

" specific theme for vim
set background=dark
let g:hybrid_transparent_background = 1
let g:enable_italic_font = 1
colorscheme hybrid_material

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
