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
" Overrides neocomplcache with regular keyword completion
inoremap <expr><C-k> "\<C-x><C-n>"

" Tab / Shift-Tab to cycle completions
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"---------------------------------------------------------------------------
" Set keyboard shortscuts for pasting from outside
"---------------------------------------------------------------------------
"imap <C-F> <C-X><C-O>
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

"---------------------------------------------------------------------------
" VimPdb Settings
"---------------------------------------------------------------------------

