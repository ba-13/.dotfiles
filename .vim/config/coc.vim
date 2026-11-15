" coc.nvim configuration (sourced from ~/.vimrc)

set updatetime=300
set signcolumn=yes
set shortmess+=c

" completion popup: Tab/S-Tab to move, Enter to accept
inoremap <silent><expr> <Tab>   coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR>    coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <C-Space> coc#refresh()

" navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" docs, rename, fixes
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>ca <Plug>(coc-codeaction-cursor)
nnoremap <leader>o :CocList outline<CR>
nnoremap <leader>s :CocList -I symbols<CR>
nnoremap <leader>d :CocList diagnostics<CR>

" header/source switch
nnoremap <leader>h :CocCommand clangd.switchSourceHeader<CR>
