vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_method = 'skim'

vim.api.nvim_exec(
[[
function! s:TexFocusVim() abort
  " Replace `TERMINAL` with the name of your terminal application
  " Example: execute "!open -a iTerm"  
  " Example: execute "!open -a Alacritty"
  silent execute "!open -a Alacritty"
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
augroup END
]],
false)





-- Disable vimtex insertmode mappings
--
-- " Example: make `<leader>wc` call the command `VimtexCountWords`;
-- noremap <leader>wc <Cmd>VimtexCountWords<CR>
--
-- " Example: adding `\big` to VimTeX's delimiter toggle list
-- let g:vimtex_delim_toggle_mod_list = [
--   \ ['\left', '\right'],
--   \ ['\big', '\big'],
--   \]
--
--   " Use `<localleader>c` to trigger continuous compilation...
-- nmap <localleader>c <Plug>(vimtex-compile)
--
-- " ...or single-shot compilation, if you prefer.
-- nmap <localleader>c <Plug>(vimtex-compile-ss)
--
-- " Use `update` to ensure document is saved before single-shot compilation
-- noremap <localleader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
--
--" Don't open QuickFix for warning messages if no errors are present
-- let g:vimtex_quickfix_open_on_warning = 0
--
--
--
-- " Filter out some compilation warning messages from QuickFix display
-- let g:vimtex_quickfix_ignore_filters = [
--       \ 'Underfull \\hbox',
--       \ 'Overfull \\hbox',
--       \ 'LaTeX Warning: .\+ float specifier changed to',
--       \ 'LaTeX hooks Warning',
--       \ 'Package siunitx Warning: Detected the "physics" package:',
--       \ 'Package hyperref Warning: Token not allowed in a PDF string',
--       \]
--
--   vimtex-commands
--   vimtex-default-mappings
--   vimtex-options
--   vimtex-imaps
--   vimtex-features
--   vimtex-default-mapping
--   vimtex-syntax-packages
--   vimtex-completion
--   vimtex-folding
--   vimtex-lint
--   vimtex-grammar
--   vimtex-navigation
--   vimtex-toc
--   vimtex-includeexpr
--   g:vimtex_compiler_latexmk
--   g:vimtex_quickfix_enabled
--
--
--   vimtex-view-skim
--
--
--
--   If you have a choice of editor, use Neovim—everything works on every OS
--
--   Try zathura from homebrew
--   
--   I suggest you read through the VimTeX documentation beginning at :help g:vimtex_view_enabled and ending at :help g:vimtex_view_zathura_check_libsynctex. Although not all of the material will be relevant to your operating system or PDF reader, you will still find plenty of interesting information and configuration options.
--   


