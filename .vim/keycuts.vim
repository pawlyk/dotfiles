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
"map <F2> <esc>:TlistToggle<cr>
"vmap <F2> <esc>:TlistToggle<cr>
"imap <F2> <esc>:TlistToggle<cr>

"---------------------------------------------------------------------------
" TagBar Settings
"---------------------------------------------------------------------------
" Toggle the TagBar on an off with F2
nmap <F2> :TagbarToggle<CR>


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
" Undotree Plugin Settings
"---------------------------------------------------------------------------
" Toggle the Undotree on an off with F5
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

" SuperTab like snippets behavior.
imap <silent><expr><tab> neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap <tab> <right><plug>(neocomplcache_snippets_jump)

" Plugin key-mappings.
" Ctrl-k expands snippet & moves to next position
" <CR> chooses highlighted value
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#complete_common_string()


" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()

"---------------------------------------------------------------------------
" Neocomplcache Plugin Settings
"---------------------------------------------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"---------------------------------------------------------------------------
" Set keyboard shortscuts for pasting from outside
"---------------------------------------------------------------------------
"imap <C-F> <C-X><C-O>
vmap <C-C> "+yi
imap <C-C> "+yi
imap <C-V> <esc>"+gPi
vmap <C-V> <esc>"+gPi

"---------------------------------------------------------------------------
" VimPdb Settings
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" Set keyboard shortscuts for switch betwen relative and absolute line numbers
"---------------------------------------------------------------------------
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-s> :call NumberToggle()<cr>

au FocusLost * :set number
au FocusLost * :wa
au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"---------------------------------------------------------------------------
" Useful keyboard shortscuts
"---------------------------------------------------------------------------
" Add a GUID to the current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Underline the current line with '='
nmap <silent> <Leader>ul :t.\|s/./=/g\|:nohls<cr>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" easier moving block of code
vnoremap < <gv
vnoremap > >gv

" call ack
nmap <Leader>a <Esc>:Ack!

" code folding
set foldmethod=indent
"set foldnestmax=10
"set nofoldenable
set foldlevel=99
"augroup vimrc
  "au BufReadPre * setlocal foldmethod=syntax
  "au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"augroup END
inoremap <C-Space> <C-O>za
nnoremap <C-Space> za
onoremap <C-Space> <C-C>za
vnoremap <C-Space> zf

" Set to ; the same behavior that :
nnoremap ; :

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Fold html tag
nnoremap <leader>ft Vatzf

" Sort CSS
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Rehardwrap paragraphs of text
nnoremap <leader>q gqip

" reselect the text that was just pasted
nnoremap <leader>v V`]

" Split window verticaly
nnoremap <leader>w <C-w>v<C-w>l

" Movements beetwen windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" save with sudo permissions
cmap w!! %!sudo tee > /dev/null %
