" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Initialize plugin system
call plug#end()

au BufReadPost *.rsh set filetype=reach
au Filetype reach set syntax=javascript

let g:LanguageClient_serverCommands = {
\ 'reach': ['node', '~/.vim/reach-ide/server/out/server.js', '--stdio']
                        \ }

let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile =  expand('~/.vim/reach-language-client.log')
let g:LanguageClient_serverStderr = expand('~/.vim/reach-language-server.log')

nnoremap <silent> <F4> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <F3> :call LanguageClient#textDocument_codeAction()<CR>

