" Default value is clap
let g:dashboard_default_executive ='telescope'
let s:header = [
	\'     / | / /__  ____| |  / (_)___ ___ ',
	\'    /  |/ / _ \/ __ \ | / / / __ `__ \',
	\'   / /|  /  __/ /_/ / |/ / / / / / / /',
	\'  /_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
	\'',
    \'         [ @rbaumgardner93 ]			',
	\ ]
let g:dashboard_custom_header = s:header

let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC t c',
\ 'find_word'          : 'SPC f g',
\ 'book_marks'         : 'SPC f m',
\ }

