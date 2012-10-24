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
nnoremap <F5> <esc> :UndotreeToggle<cr>

"---------------------------------------------------------------------------
" Neocomplcache Plugin Settings
"---------------------------------------------------------------------------
" Overrides neocomplcache with regular keyword completion
"inoremap <expr><TAB> "\<C-X><C-u>"
"inoremap <expr><C-TAB> "\<C-x><C-p>"
"inoremap <expr><S-TAB> "\<C-x><C-n>"
"
"imap <expr><Tab>    neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
" Tab / Shift-Tab to cycle completions
"inoremap <expr><TAB> pumvisible() ? "\<C-X><C-O>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "\<S-TAB>"
"inoremap <expr><c-TAB> pumvisible() ? "\<C-p>" : "\<c-TAB>"
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
"inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

"---------------------------------------------------------------------------
" Set keyboard shortscuts for pasting from outside
"---------------------------------------------------------------------------
"imap <C-F> <C-X><C-O>
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

"---------------------------------------------------------------------------
" VimPdb Settings
"---------------------------------------------------------------------------

