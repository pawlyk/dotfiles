"---------------------------------------------------------------------------
" NERD Tree Settings
"---------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F1
nmap <F1> :NERDTreeToggle $HOME<CR>

" Close the NERD Tree with Shift-F1
"nmap <S-F1> :NERDTreeClose<CR>

"---------------------------------------------------------------------------
" Tag List Settings
"---------------------------------------------------------------------------
" Toggle the Tag List on an off with F2
map <F2> <esc>:TlistToggle<cr>
vmap <F2> <esc>:TlistToggle<cr>
imap <F2> <esc>:TlistToggle<cr>

"---------------------------------------------------------------------------
" TagBar Settings
"---------------------------------------------------------------------------
" Toggle the TagBar on an off with F2
"nmap <F2> :TagbarToggle<CR> 


"---------------------------------------------------------------------------
" Bufffer Explorer Settings
"---------------------------------------------------------------------------
" Toggle the Bufffer Explorer on an off with F3
nmap <F3> <Esc>:BufExplorer<cr>
vmap <F3> <esc>:BufExplorer<cr>
imap <F3> <esc>:BufExplorer<cr>

"---------------------------------------------------------------------------
" MRU Settings
"---------------------------------------------------------------------------
" Toggle the MRU on an off with F4
nmap <F4> <esc>:MRU<cr>
vmap <F4> <esc>:MRU<cr>
imap <F4> <esc>:MRU<cr>

"---------------------------------------------------------------------------
" Gundo Plugin Settings
"---------------------------------------------------------------------------
" Toggle the Gundo on an off with F5
nnoremap <F5> :GundoToggle<CR>

"---------------------------------------------------------------------------
" Neocomplcache Plugin Settings
"---------------------------------------------------------------------------
" CTRL+Tab (plugin-neocomplcache)
imap <C-Tab> <C-X><C-U>
" On/Off autocomplete
"menu Tools.Toggle\ Autocomplete<tab> :NeoComplCacheToggle <cr>
"imenu Tools.Toggle\ Autocomplete<tab> <esc>:NeoComplCacheToggle <cr>i

" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

"---------------------------------------------------------------------------
" SuperTab Plugin Settings
"---------------------------------------------------------------------------
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

"---------------------------------------------------------------------------
" Set keyboard shortscuts for pasting from outside
"---------------------------------------------------------------------------
imap <C-F> <C-X><C-O>
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

"---------------------------------------------------------------------------
" Completion 
"---------------------------------------------------------------------------
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"---------------------------------------------------------------------------
" VimPdb Settings
"---------------------------------------------------------------------------

