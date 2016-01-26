nnoremap <buffer> gq :set operatorfunc=SmartGQ<cr>g@
nnoremap <buffer> gqq :<c-u>call SmartGQ('')<cr>
vnoremap <buffer> gq :<c-u>call SmartGQ(visualmode())<cr>

nnoremap <buffer> gw :let b:pos=winsaveview()<cr>:set operatorfunc=SmartGQ<cr>g@
nnoremap <buffer> gww :let b:pos=winsaveview()<cr>:<c-u>call SmartGQ('')<cr>
vnoremap <buffer> gw <esc>:let b:pos=winsaveview()<cr>:<c-u>call SmartGQ(visualmode())<cr>


let b:smart_gq_program = 'autopep8 -a'


