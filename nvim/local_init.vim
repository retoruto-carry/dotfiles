" インサートモードから抜ける
inoremap <silent> jj <ESC>

" 検索ハイライトをescキーを押したら消えるようにする
nnoremap <ESC><ESC> :nohl<CR>

" molokai の見にくさを改善する
hi Comment ctermfg=102
hi Visual  ctermbg=239

" 背景を端末の背景と同じ色・透明度にする
" cf. http://h-miyako.hatenablog.com/entry/2014/12/25/004638
let g:seiya_auto_enable=1

" 途中からハイライトされなくなる現象を解決
" cf. https://qiita.com/kaede_sato/items/604713a3e6b4cf4be8a5
" 懸念点: <style>の中でハイライトが聞かなくなったファイルがある
autocmd FileType vue syntax sync fromstart


" NERDTree設定 ===============================================================

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTreeのツリー部分の横幅を設定
let NERDTreeWinSize=31

" ===========================================================================


" ALE設定 ===================================================================
" cf. https://github.com/w0rp/ale#usage-linting

" ALEをvim-airlineで表示
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_text_changed = 1
let g:ale_fix_on_save = 1
" 
" ローカルの設定ファイルを考慮する
let g:ale_javascript_prettier_use_local_config = 1

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

let g:ale_fixers = {
      \  'javascript': [
      \    'eslint',
      \    'prettier',
      \    'remove_trailing_lines',
      \    'trim_whitespace',
      \  ],
      \  'vue': [
      \    'eslint',
      \    'prettier',
      \    'remove_trailing_lines',
      \    'trim_whitespace',
      \  ],
      \  'ruby': [
      \    'rubocop',
      \    'remove_trailing_lines',
      \    'trim_whitespace',
      \  ],
      \}

let g:ale_linters = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \    'html': [],
      \    'css': ['stylelint'],
      \    'javascript': ['prettier', 'eslint'],
      \    'vue': ['prettier', 'eslint'],
      \ }

" ===========================================================================


" Neovim/Vim8で快適Vue.js開発(Vue Language Server)
" ===========================================================================
" https://muunyblue.github.io/520bae6649b42ff5a3c8c58b7fcfc5a9.html
" for deoplete.nvim
let g:deoplete#enable_at_startup = 1
" for LanguageClient-neovim
set hidden
let g:LanguageClient_serverCommands = {
      \ 'vue': ['vls'],
      \ 'html': [],
      \ 'javascript': [],
      \ 'css': [],
      \ }
" not stop completion $ & /
setlocal iskeyword+=$
setlocal iskeyword+=-

" deoplete.vim
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <BS>: close popup and delete backword char.
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#cancel_popup() . "\<CR>"
endfunction

" neosnippet.vim
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1

" LanguageClient-neovim
set hidden
let g:LanguageClient_serverCommands = {
      \ 'vue': ['vls'],
      \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" ===========================================================================
