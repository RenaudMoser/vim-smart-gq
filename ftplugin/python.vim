nnoremap  gq :set operatorfunc=SmartGQ<cr>g@
nnoremap  gqq :<c-u>call SmartGQ('')<cr>
vnoremap  gq :<c-u>call SmartGQ(visualmode())<cr>

let b:smart_gq_program = 'autopep8 -a'
