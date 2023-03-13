version 6.0
let s:cpo_save=&cpo
set cpo&vim
cnoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
cnoremap <expr> <Down> wilder#can_accept_completion()  ?  wilder#accept_completion()  :  '<Down>'
cnoremap <expr> <Up> wilder#can_reject_completion()  ?  wilder#reject_completion()  :  '<Up>'
cnoremap <expr> <S-Tab> wilder#in_context()  ?  wilder#previous()  :  '<S-Tab>'
inoremap <silent> <C-Bslash> <Cmd>ToggleTerm
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path('dir /s/b/a:-d')
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path('dir /s/b')
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <silent> <C-K> <Cmd>lua vim.lsp.buf.signature_help()
inoremap <C-W> u
inoremap <C-U> u
nnoremap  ggVG
snoremap <silent>  "_c
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippet()
nnoremap <silent> <NL> <Cmd>Lspsaga diagnostic_jump_next
nnoremap  <Cmd>nohlsearch|diffupdate|normal! 
snoremap  "_c
nnoremap <silent> Þ <Nop>
nnoremap <silent>  <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
nnoremap <Down> -
nnoremap <Up> +
nnoremap <Right> >
nnoremap <Left> <
nnoremap <silent>  <Cmd>execute v:count . "ToggleTerm"
nnoremap   w
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
xnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "v", auto = true})
xnoremap # y?\V"
omap <silent> % <Plug>(MatchitOperationForward)
xmap <silent> % <Plug>(MatchitVisualForward)
nmap <silent> % <Plug>(MatchitNormalForward)
nnoremap & :&&
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
xnoremap * y/\V"
nnoremap + 
nnoremap - 
nnoremap <silent> @Þ <Nop>
nnoremap <silent> @ <Cmd>lua require("which-key").show("@", {mode = "n", auto = true})
nnoremap <silent> K <Cmd>Lspsaga hover_doc
nnoremap Y y$
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
omap <silent> [% <Plug>(MatchitOperationMultiBackward)
xmap <silent> [% <Plug>(MatchitVisualMultiBackward)
nmap <silent> [% <Plug>(MatchitNormalMultiBackward)
nnoremap <silent> \Þ <Nop>
nnoremap <silent> \ <Cmd>lua require("which-key").show("\\", {mode = "n", auto = true})
nnoremap <silent> \dÞ <Nop>
nnoremap <silent> \d <Cmd>lua require("which-key").show("\\d", {mode = "n", auto = true})
nnoremap <silent> \gÞ <Nop>
nnoremap <silent> \sÞ <Nop>
nnoremap <silent> \bÞ <Nop>
nnoremap <silent> \pÞ <Nop>
nnoremap <silent> \cÞ <Nop>
nnoremap <silent> \lÞ <Nop>
nnoremap <silent> \fÞ <Nop>
xnoremap <silent> \cÞ <Nop>
xnoremap <silent> \Þ <Nop>
xnoremap <silent> \ <Cmd>lua require("which-key").show("\\", {mode = "v", auto = true})
nnoremap <nowait> <silent> \gg <Cmd>lua _LAZYGIT_TOGGLE()
nnoremap <nowait> <silent> \gs <Cmd>lua require 'gitsigns'.stage_hunk()
nnoremap <nowait> <silent> \gp <Cmd>lua require 'gitsigns'.preview_hunk()
nnoremap <nowait> <silent> \gr <Cmd>lua require 'gitsigns'.reset_hunk()
nnoremap <nowait> <silent> \go <Cmd>Telescope git_status
nnoremap <nowait> <silent> \gc <Cmd>Telescope git_commits
nnoremap <nowait> <silent> \gl <Cmd>lua require 'gitsigns'.blame_line()
nnoremap <nowait> <silent> \gd <Cmd>Gitsigns diffthis HEAD
nnoremap <nowait> <silent> \gb <Cmd>Telescope git_branches
nnoremap <nowait> <silent> \gj <Cmd>lua require 'gitsigns'.next_hunk()
nnoremap <nowait> <silent> \gu <Cmd>lua require 'gitsigns'.undo_stage_hunk()
nnoremap <nowait> <silent> \gk <Cmd>lua require 'gitsigns'.prev_hunk()
nnoremap <nowait> <silent> \sC <Cmd>Telescope commands
nnoremap <nowait> <silent> \sk <Cmd>Telescope keymaps
nnoremap <nowait> <silent> \sh <Cmd>Telescope help_tags
nnoremap <nowait> <silent> \sr <Cmd>Telescope oldfiles
nnoremap <nowait> <silent> \pS <Cmd>PackerStatus
nnoremap <nowait> <silent> \ps <Cmd>PackerSync
nnoremap <nowait> <silent> \pi <Cmd>PackerInstall
nnoremap <nowait> <silent> \pu <Cmd>PackerUpdate
nnoremap <nowait> <silent> \pc <Cmd>PackerCompile
nnoremap <nowait> <silent> \bb <Cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})
nnoremap <nowait> <silent> \bc <Cmd>Bdelete!
nnoremap <nowait> <silent> \cg <Cmd>CMakeGenerate
nnoremap <nowait> <silent> \cq <Cmd>CMakeClose
nnoremap <nowait> <silent> \cc <Cmd>CMakeClean
nnoremap <nowait> <silent> \cb <Cmd>CMakeBuild
nnoremap <nowait> <silent> \F <Cmd>Telescope live_grep theme=ivy
nnoremap <nowait> <silent> \lw <Cmd>Telescope diagnostics
nnoremap <nowait> <silent> \ls <Cmd>Telescope lsp_document_symbols
nnoremap <nowait> <silent> \li <Cmd>LspInfo
nnoremap <nowait> <silent> \ll <Cmd>lua vim.lsp.codelens.run()
nnoremap <nowait> <silent> \lS <Cmd>Telescope lsp_dynamic_workspace_symbols
nnoremap <nowait> <silent> \ld <Cmd>Telescope diagnostics bufnr=0
nnoremap <nowait> <silent> \la <Cmd>lua vim.lsp.buf.code_action()
nnoremap <nowait> <silent> \lf <Cmd>lua vim.lsp.buf.format{async=true}
nnoremap <nowait> <silent> \lq <Cmd>lua vim.diagnostic.setloclist()
nnoremap <nowait> <silent> \lI <Cmd>LspInstallInfo
nnoremap <nowait> <silent> \a <Cmd>Dashboard
nnoremap <nowait> <silent> \di <Cmd>lua require('dap').step_into()
nnoremap <nowait> <silent> \ds <Cmd>lua require('dapui').float_element('scope')
nnoremap <nowait> <silent> \de <Cmd>lua require('dapui').eval()
nnoremap <nowait> <silent> \db <Cmd>lua require('dap').toggle_breakpoint()
nnoremap <nowait> <silent> \do <Cmd>lua require('dap').step_over()
nnoremap <nowait> <silent> \dc <Cmd>lua require('dap').continue()
nnoremap <nowait> <silent> \dr <Cmd>lua require('dap').repl().open()
nnoremap <nowait> <silent> \dss <Cmd>lua require('dap').step_out()
nnoremap <nowait> <silent> \dj <Cmd>lua require('dap').up()
nnoremap <nowait> <silent> \dq <Cmd>lua require('dap').terminate()
nnoremap <nowait> <silent> \dk <Cmd>lua require('dap').down()
nnoremap <nowait> <silent> \dw <Cmd>lua require('dapui').float_element('watch')
nnoremap <nowait> <silent> \fg <Cmd>GitFiles
nnoremap <nowait> <silent> \fp <Cmd>Telescope projects
nnoremap <nowait> <silent> \ff <Cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})
nnoremap <nowait> <silent> \q <Cmd>quitall
nnoremap <nowait> <silent> \w <Cmd>w!
nnoremap <nowait> <silent> \e <Cmd>NvimTreeToggle
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
omap <silent> ]% <Plug>(MatchitOperationMultiForward)
xmap <silent> ]% <Plug>(MatchitVisualMultiForward)
nmap <silent> ]% <Plug>(MatchitNormalMultiForward)
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xnoremap <silent> aÞ <Nop>
xnoremap <silent> a <Cmd>lua require("which-key").show("a", {mode = "v", auto = true})
xmap a% <Plug>(MatchitVisualTextObject)
nnoremap <silent> dÞ <Nop>
nnoremap <silent> d <Cmd>lua require("which-key").show("d", {mode = "n", auto = true})
nnoremap dw vb"_d
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
nnoremap <silent> gr <Cmd>Lspsaga rename
nnoremap <silent> gp <Cmd>Lspsaga peek_definition
nnoremap <silent> gd <Cmd>Lspsaga lsp_finder
nnoremap <silent> gl <Cmd>Lspsaga show_diagnostic
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
omap <silent> g% <Plug>(MatchitOperationBackward)
xmap <silent> g% <Plug>(MatchitVisualBackward)
nmap <silent> g% <Plug>(MatchitNormalBackward)
xnoremap <silent> iÞ <Nop>
xnoremap <silent> i <Cmd>lua require("which-key").show("i", {mode = "v", auto = true})
nnoremap <silent> sÞ <Nop>
nnoremap <silent> s <Cmd>lua require("which-key").show("s", {mode = "n", auto = true})
nnoremap sv :vsplitw
nnoremap ss :splitw
nnoremap te :tabedit
nnoremap x "_x
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
nnoremap <silent> <C-W>Þ <Nop>
nnoremap <silent> <C-W> <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
nnoremap <silent> <C-Bslash> <Cmd>execute v:count . "ToggleTerm"
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
nnoremap <silent> <Plug>(CMakeStop) :call cmake#Stop()
nnoremap <silent> <Plug>(CMakeClose) :call cmake#Close()
nnoremap <silent> <Plug>(CMakeOpen) :call cmake#Open()
nnoremap <silent> <Plug>(CMakeTest) :call cmake#Test(0)
nnoremap <Plug>(CMakeBuildTarget) :CMakeBuild 
nnoremap <silent> <Plug>(CMakeInstall) :call cmake#Install()
nnoremap <silent> <Plug>(CMakeBuild) :call cmake#Build(0)
nnoremap <Plug>(CMakeSwitch) :CMakeSwitch 
nnoremap <silent> <Plug>(CMakeClean) :call cmake#Clean()
nnoremap <silent> <Plug>(CMakeGenerate) :call cmake#Generate(0)
snoremap <C-R> "_c
snoremap <silent> <C-H> "_c
snoremap <silent> <Del> "_c
snoremap <silent> <BS> "_c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <C-J> <Cmd>Lspsaga diagnostic_jump_next
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
xmap <silent> <Plug>(MatchitVisualTextObject) <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)
onoremap <silent> <Plug>(MatchitOperationMultiForward) :call matchit#MultiMatch("W",  "o")
onoremap <silent> <Plug>(MatchitOperationMultiBackward) :call matchit#MultiMatch("bW", "o")
xnoremap <silent> <Plug>(MatchitVisualMultiForward) :call matchit#MultiMatch("W",  "n")m'gv``
xnoremap <silent> <Plug>(MatchitVisualMultiBackward) :call matchit#MultiMatch("bW", "n")m'gv``
nnoremap <silent> <Plug>(MatchitNormalMultiForward) :call matchit#MultiMatch("W",  "n")
nnoremap <silent> <Plug>(MatchitNormalMultiBackward) :call matchit#MultiMatch("bW", "n")
onoremap <silent> <Plug>(MatchitOperationBackward) :call matchit#Match_wrapper('',0,'o')
onoremap <silent> <Plug>(MatchitOperationForward) :call matchit#Match_wrapper('',1,'o')
xnoremap <silent> <Plug>(MatchitVisualBackward) :call matchit#Match_wrapper('',0,'v')m'gv``
xnoremap <silent> <Plug>(MatchitVisualForward) :call matchit#Match_wrapper('',1,'v'):if col("''") != col("$") | exe ":normal! m'" | endifgv``
nnoremap <silent> <Plug>(MatchitNormalBackward) :call matchit#Match_wrapper('',0,'n')
nnoremap <silent> <Plug>(MatchitNormalForward) :call matchit#Match_wrapper('',1,'n')
nnoremap <F8> :TagbarToggle
nnoremap <C-W><Down> -
nnoremap <C-W><Up> +
nnoremap <C-W><Right> >
nnoremap <C-W><Left> <
nnoremap <C-A> ggVG
nnoremap <C-L> <Cmd>nohlsearch|diffupdate|normal! 
cnoremap <expr> 	 wilder#in_context()  ?  wilder#next()  :  '	'
inoremap <silent> 	 =UltiSnips#ExpandSnippet()
inoremap <silent>  <Cmd>lua vim.lsp.buf.signature_help()
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
inoremap  u
inoremap  u
inoremap <silent>  <Cmd>ToggleTerm
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=start,eol,indent
set backupskip=/tmp/*,/private/tmp/*
set clipboard=unnamed,unnamedplus
set completeopt=menuone,noinsert,noselect
set eventignore=CursorHoldI,CursorHold
set expandtab
set formatoptions=1tjcq
set helplang=en
set ignorecase
set inccommand=split
set indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,0=end,0=until
set operatorfunc=<SNR>61_go
set path=.,/usr/include,,**
set pumblend=5
set runtimepath=~\\AppData\\Local\\nvim,~\\AppData\\Local\\nvim-data\\site,~\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim,~\\scoop\\apps\\neovim\\current\\share\\nvim\\runtime,~\\scoop\\apps\\neovim\\current\\share\\nvim\\runtime\\pack\\dist\\opt\\matchit,~\\scoop\\apps\\neovim\\current\\lib\\nvim,~\\AppData\\Local\\nvim-data\\site/pack/*/start/*,~\\AppData\\Local\\nvim-data\\site/pack/*/start/*\\after,~\\AppData\\Local\\nvim-data\\site\\after,~\\AppData\\Local\\nvim\\after
set scrolloff=10
set shiftwidth=2
set smartindent
set statusline=%#Normal#
set tabstop=2
set termguicolors
set title
set wildcharm=<Tab>
set wildignore=*/node_modules/*
set wildoptions=pum
set window=73
" vim: set ft=vim :
