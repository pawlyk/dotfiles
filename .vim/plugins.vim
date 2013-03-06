"---------------------------------------------------------------------------
" MiniBufExplorer Settings
"---------------------------------------------------------------------------
"disallow more that 1 miniBufExplorer
let g:miniBufExplorerMoreThanOne = 0
" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplModSelTarget = 0
" make tabs show complete (no broken on two lines)
let g:miniBufExplTabWrap = 1
"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guifg=LightBlue
" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guifg=Red
" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=Green
" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guifg=Red

"---------------------------------------------------------------------------
" BufExplorer Settings
"---------------------------------------------------------------------------
" Do not sort in reverse order.
let g:bufExplorerReverseSort=0
" Show directories.
let g:bufExplorerShowDirectories=1
" Show relative paths.
let g:bufExplorerShowRelativePath=0
" Show unlisted buffers.
let g:bufExplorerShowUnlisted=0
" Sort by most recently used.
let g:bufExplorerSortBy='name'
" Split new window above current.
let g:bufExplorerSplitBelow=0

set switchbuf=usetab,newtab

"---------------------------------------------------------------------------
" TagBar Settings
"---------------------------------------------------------------------------
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1

"---------------------------------------------------------------------------
" MRU Settings
"---------------------------------------------------------------------------
" set max entries
let MRU_Max_Entries = 1000
" set exclude path
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
" set window height
let MRU_Window_Height = 62
" set MRU in current window
let MRU_Use_Current_Window = 1
" set max MRU menu entries
let MRU_Max_Menu_Entries = 100
" set max MRUsubmenu entries
let MRU_Max_Submenu_Entries = 15

"---------------------------------------------------------------------------
" Neocomplcache Plugin Settings
"---------------------------------------------------------------------------
" Use neocomplcache.
"let g:neocomplcache_enable_at_startup=1
"let g:neocomplcache_enable_cursor_hold_i=1
"let g:neocomplcache_cursor_hold_i_time=200
"let g:neocomplcache_auto_completion_start_length=1

""Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w'
"let g:neocomplcache_omni_patterns.python = '[^. *\t]\.\w'

"let g:neocomplcache_snippets_dir='~/.vim/bundle/snipmate/snippets'

"" Required to make neocomplcache_cursor_hold_i_time work
"" See https://github.com/Shougo/neocomplcache/issues/140
"let s:update_time_save = &updatetime
"autocmd InsertEnter * call s:on_insert_enter()

"function! s:on_insert_enter()
  "if &updatetime > g:neocomplcache_cursor_hold_i_time
    "let s:update_time_save = &updatetime
    "let &updatetime = g:neocomplcache_cursor_hold_i_time
  "endif
"endfunction

"autocmd InsertLeave * call s:on_insert_leave()

"function! s:on_insert_leave()
  "if &updatetime < s:update_time_save
    "let &updatetime = s:update_time_save
  "endif
"endfunction

"" Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto = 1
"" Show clang errors in the quickfix window
"let g:clang_complete_copen = 1

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_snippets_dir='~/.vim/bundle/snipmate-snippets/snippets'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

"---------------------------------------------------------------------------
" Neosnippet Plugin Settings
"---------------------------------------------------------------------------
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

"---------------------------------------------------------------------------
" SuperTab Plugin Settings
"---------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

"---------------------------------------------------------------------------
" CtrlP Plugin Settings
"---------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_custom_ignore = '\.exe$\|\.so$\|\.dll$'
let g:ctrlp_custom_ignore = 'some_bad_symbolic_links' 
let g:ctrlp_user_command = 'find %s -type f'

"---------------------------------------------------------------------------
" Fugitive Settings
"---------------------------------------------------------------------------
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

"---------------------------------------------------------------------------
" NERD Tree Plugin Settings
"---------------------------------------------------------------------------
" Show hiden files on startup
let NERDTreeShowHidden=1
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$', '\.idea',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$',
                   \ '\.pyc', '\.pyo', '\~$', '\.swo$', '\.swp$', 
                   \ '\.git$', '\.hg$', '\.svn$', '\.bzr$']

"---------------------------------------------------------------------------
" snipMate Plugin Settings
"---------------------------------------------------------------------------
" Toggle the snipMate on an off with Tab
:filetype plugin on

"---------------------------------------------------------------------------
" Vim Git Gutter Plugin Settings
"---------------------------------------------------------------------------
" Turn on git-gutter
let g:gitgutter_enabled = 1
" Turn on git-gutter highlight
let g:gitgutter_highlights = 1
