" .vimrc File
" Maintained by: Doron Gombosh
" doron.gombosh@siverge.com
" http://www.siverge.com
"

version 7.3

"Forget compatibility with Vi. Who cares. FIXME need to be checked
set nocompatible

filetype off
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

set visualbell              " enable the visual bell 

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
"set autowrite
set noautowrite

"move btween windows with ctrl
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"add to taswk list
map <leader>td <Plug>TaskList

"revision history tool
map <leader>g :GundoToggle<CR>

"replaces grep
nmap <leader>a <Esc>:Ack!

"pyflakes
let g:pyflakes_use_quickfix = 0

"for python activate supertab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"Display current cursor position in lower right corner.
"set ruler

""Want a different map leader than \
""set mapleader = ",";
"
""Ever notice a slight lag after typing the leader key + command? This lowers
""the timeout.
""set timeoutlen=500
"
""Set the color scheme. Change this to your preference.
""Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
colorscheme torte

set backspace=2

"Set font type and size. Depends on the resolution. Larger screens, prefer h20
"set guifont=LucidaTypewriter\ \9
"set guifont=Monospace\ \9

let Tlist_Ctags_Cmd="C:/\ctags58/\ctags.exe"
"Tab stuff http://vimcasts.org/episodes/tabs-and-spaces/
"set tabstop=4
"set shiftwidth=4
""set softtabstop=3
"set expandtab
""set smarttab
"
"set shortmess=xotI          " shorten messages
"
""Show command in bottom right portion of the screen
"set showcmd
"
""When a bracket is inserted briefly jump to the matching one
"set showmatch
"
""Show lines numbers
"set number
"
""Indent stuff
""set smartindent
"set autoindent
"
"set whichwrap=bshl<>[]      " allow movement between lines
"
""Always show the status line
"set laststatus=2
"
""Prefer a slightly higher line height TODO what is this?
"set linespace=3
"
""Better line wrapping
"set wrap
"" Make shift-W toggle between wrap and unwrap longlines
"map <S-W>  :set wrap! <CR>
"
"" Allow virtual edit, place cursor wherever you want
"" set ve=all
"set ve=block
"
""set textwidth=79
"set textwidth=0 "unlimited
""set formatoptions=qrnl1
"
""Set incremental searching"
"set incsearch
"
""Highlight searching
"set hlsearch
"
"" case insensitive search
"set ignorecase
"set smartcase
"
"Enable code folding
"set foldenable
set foldmethod=indent
set foldlevel=99

""Hide mouse when typing
"set mousehide
"
""Shortcut to fold tags with leader (usually \) + ft
""nnoremap <leader>ft Vatzf
"
"" Create dictionary for custom expansions FIXME useful for UVM
"set dictionary+=/store/public/Temp/uvm_dict.txt
"
""Opens a vertical split and switches over (\v)
"nnoremap <leader>v <C-w>v<C-w>l
"
"map <leader>dos :e ++ff=dos<CR>
"
""Split windows below the current window.
"set splitbelow              
"
"" session settings TODO what it does??
""set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
"
""Set up an HTML5 template for all new .html files FIXME for system verilog
""autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

""Saves time; maps the spacebar to colon
""nmap <space> :
"" Make Space bar enter insert mode
"map <Space> <Insert>
"
""Automatically change current directory to that of the file in the buffer
"autocmd BufEnter * cd %:p:h
"
""Map code completion to , + tab TODO might be use
""imap <leader><tab> <C-x><C-o>
"
"" More useful command-line completion
"set wildmenu
"
"" wildchar	key that triggers command-line expansion
"set wildchar=<Tab>
"
"" Set showmode (show the mode in the bottom - visual/insert etc.)
"set smd
"
"" Make complete look in dictionary
"set cpt=.,k,b,t,i
"
"" Show complittion
"set sft
"
"" number of screen lines to show around the cursor
"set so=2
"
"if has("gui_running")
"  " GUI is running or is about to start.
"  " Maximize gvim window.
"  set lines=999 columns=999
"endif
"
"" Make history buffer larger default 20
"set hi=2000
"
"" Make shell commands work faster
""set shell=csh\ -f
"
"" suffixesadd - used when searching for a file
"set suffixesadd=.v,.e,.py,.sv
"
""path - This is a list of directories which will be searched TODO what is it
""doing
"set path=.,,./**,../**
"
""TODO what is explVertical in gvimrc
"
"be xterm
"
"" Make block mode work in insert mode
"map! <C-V> <Esc><C-V>
"
""Auto-completion menu TODO what is this?
"set wildmode=list:longest
"
""http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
""set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"
""Delete all buffers (via Derek Wyatt) TODO what is this?
"nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
"
""Bubble single lines (kicks butt)
""http://vimcasts.org/episodes/bubbling-text/
"nmap <C-Up> ddkP
"nmap <C-Down> ddp
"
""Bubble multiple lines
"vmap <C-Up> xkP`[V`]
"vmap <C-Down> xp`[V`]
"
" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost _vimrc source ~/_vimrc
 augroup END
endif
"
"" easier window navigation
""nmap <C-h> <C-w>h
""nmap <C-j> <C-w>j
""nmap <C-k> <C-w>k
""nmap <C-l> <C-w>l
"
""------------------------"
""NERDTREE PLUGIN SETTINGS
""------------------------"
""Shortcut for NERDTreeToggle
""nmap <leader>nt :NERDTreeToggle <CR>
"
""Show hidden files in NerdTree
"let NERDTreeShowHidden=1
"
""autopen NERDTree and focus cursor in new document
""autocmd VimEnter * NERDTree
""autocmd VimEnter * wincmd p
"
""Spelling corrects. Just for example. Add yours below.
"iab teh the
"iab Teh The
"
"" Get to home dir easier
"" <leader>hm is easier to type than :cd ~
"nmap <leader>hm :cd ~/ <CR>
"
"" Saves file when Vim window loses focus
""au FocusLost * :wa
"
"" Backups
""set backupdir=~/.vim/tmp/backup// " backups
""set directory=~/.vim/tmp/swap// " swap files
""set backup " enable backup
"set nobackup
"
"set showmatch " show matching brackets
"
"set viminfo='100,\"50,:200  " read /write a .viminfo file, don't store more than 50 lines of registers
"
"" Use popup menu for right mouse button and keep shift-left mouse button as search
"set mousemodel=popup
"map <S-LeftMouse> <LeftMouse>*
"map! <S-LeftMouse> <Esc><LeftMouse>*
"
""Added by orenc
""Make sure that <EOL> is displayed as ^M when file type is "MS-DOS" or "Mac"
"set ffs=unix
"
"" confirm start a dialog when a command fails
"set cf
"
""TODO what is ttym what is sel (selection)
"
"" equalalways	make all windows the same size when adding/removing windows
"set noea
"
"autocmd BufNewFile *.py call InsertPythonPackage() 
"
""TODO change name
"function! InsertPythonPackage() 
"    let dir = getcwd() 
"    let result = append(0, "'''")     
"    let result = append(1, "-------------------------------------------------------------------------") 
"    let filename = expand("%") 
"    let result = append(2, "File name    : " . filename ) 
"    let result = append(3, "Title        : ") 
"    let result = append(4, "Project      : CFPGA") 
"    let result = append(5, "Developers   : Doron Gombosh ") 
"    let date = strftime("%a %b %d, %Y  %I:%M%p")
"    let result = append(6, "Created      : " . date) 
"    let result = append(7, "Description  : ") 
"    let result = append(8, "Notes        : ") 
"    let result = append(9, "---------------------------------------------------------------------------") 
"    let result = append(10, "Copyright 2012 (c) Siverge Networks") 
"    let result = append(11, "---------------------------------------------------------------------------*/")
"    let result = append(12, "'''")     
"  
"endfunction
"
"autocmd BufNewFile *.v,*.sv,*.svh call InsertVerilogPackage()
"
""TODO change name
"function! InsertVerilogPackage() 
"    let filename = expand("%") 
"    let date = strftime("%a %b %d, %Y  %I:%M%p")
"	 let result = append(0, "// -------------------------------------------------------------------------")
"	 let result = append(1, "// File name		: " . filename . " ")
"	 let result = append(2, "// Title				: ")
"	 let result = append(3, "// Project      	: ")
"	 let result = append(4, "// Developers   	: Doron Gombosh ")
"	 let result = append(5, "// Created      	: " . date . " ")
"	 let result = append(6, "// Last modified  : ")
"	 let result = append(7, "// Description  	: ")
"	 let result = append(8, "// Notes        	: ")
"	 let result = append(9, "// Version			: 0.1")
"	 let result = append(10, "// ---------------------------------------------------------------------------")
"	 let result = append(11, "// Copyright 2013 (c) Siverge Networks Ltd")
"	 let result = append(12, "// Confidential Proprietary ")
"	 let result = append(13, "// ---------------------------------------------------------------------------")
"endfunction
"
"
"" map the [ ] keys
"" go to start/end of next line
"map [ 0<NL> 
"map ] $<NL>
"
"" save and suspend
"map Z :w<NL>
"
"
"map <F10> :co .<NL>:s/[!-~]/-/g<NL>:s/- -/---/g<NL>:s/-  -/----/g<NL>
"
""Menu items for Commenting and Un-Commenting code 
"amenu 20.435 &Edit.-SEP4- : 
"amenu Edit.Comment <ESC>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call Comment(fl, ll)<CR> 
"amenu Edit.UnComment <ESC>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call UnComment(fl, ll)<CR>
"
""Function for commenting a block of Visually selected text 
"function! Comment(fl, ll) 
"    let i=a:fl 
"let comment="//" 
"while i<=a:ll 
"    let cl=getline(i) 
"let cl2=comment.cl 
"call setline(i, cl2) 
"let i=i+1 
"endwhile 
"endfunction 
"
""Function for Un-Commenting a block of Visually selected text 
"function! UnComment(fl, ll) 
"    let i=a:fl 
"let comment="//" 
"while i<=a:ll 
"    let cl=getline(i) 
"let cl2=substitute(cl, "//", "", "") 
"call setline(i, cl2) 
"let i=i+1 
"endwhile 
"endfunction 
"
""-------------------------------------------------------------------
""Function for commenting a block of Visually selected text 
"function! Commentpy(fl, ll) 
"    let i=a:fl 
"let comment="#" 
"while i<=a:ll 
"    let cl=getline(i) 
"let cl2=comment.cl 
"call setline(i, cl2) 
"let i=i+1 
"endwhile 
"endfunction 
"
""Function for Un-Commenting a block of Visually selected text 
"function! UnCommentpy(fl, ll) 
"    let i=a:fl 
"let comment="#" 
"while i<=a:ll 
"    let cl=getline(i) 
"let cl2=substitute(cl, "#", "", "") 
"call setline(i, cl2) 
"let i=i+1 
"endwhile 
"endfunction 
""-------------------------------------------------------------------
"
"" Insert # comments
"vmap <F2>  <ESC>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call Comment(fl, ll)<CR> 
"vmap <S-F2> <ESC>`<:let fl=line(".")<CR>`>:let ll=line(".")<CR>:call UnComment(fl, ll)<CR> 
"
"" Useful abbreviations
"iab DG Doron Gombosh
"iab OE Omer Ephrat
"iab YG Yael Gluk
"iab YB Yuval Berger
"
""TODO move to global file
"au BufReadPost *.vsif so ~/bin/vsif.vim
""au BufReadPost *.sv so ~/.vim/syntax/systemverilog.vim
"
"" maximum of 20 tabs opened with -p
"set tabpagemax=20
"
""guioptions	list of flags that specify how the GUI works
"set go+=acegmiLTrtb
"set guitablabel=%t
"
""svn 
"map <S-F11> :!svn lock %<CR>
"map <S-F12> :!svn ci % -m " "<CR>
"map <F12> :tabnew 
"map <F11> :close <CR>
"map <F9>  :MyGrep 
"imap <F9> <ESC>:MyGrep 
"map <S-F9> :MyGrep "<cword>" .<CR>
"vmap <S-F9> :MyGrep "<cword>" .<CR>
""Add grep abbilty to gvim
"function! MyGrep(...)
"  if a:0 < 2
"    echo "Usage: MyGrep <options> <pattern> <dir>"
"    echo 'Example: MyGrep -r "cow" ~/Desktop/*'
"    return
"  endif
"  if a:0 == 2
"    let options = '-rsinI'
"    let pattern = a:1
"    let dir = a:2
"  else
"    let options = a:1 . 'snI'
"    let pattern = a:2
"    let dir = a:3
"  endif
"  let exclude = 'grep -v "/.svn"'
"  let cmd = 'grep '.options.' '.pattern.' '.dir. '| '.exclude
"  let cmd_output = system(cmd)
"  if cmd_output == ""
"    echomsg "Pattern " . pattern . " not found"
"    return
"  endif
"
"  let tmpfile = tempname()
"  exe "redir! > " . tmpfile
"  silent echon '[grep search for "'.pattern.'" with options "'.options.'"]'."\n"
"  silent echon cmd_output
"  redir END
"
"  let old_efm = &efm
"  set efm=%f:%\\s%#%l:%m
"
"  execute "silent! cgetfile " . tmpfile
"  let &efm = old_efm
"  botright copen
"
"  call delete(tmpfile)
"endfunction
"command! -nargs=* -complete=file MyGrep call MyGrep(<f-args>)
"
""FIXME work with session as project
""nmap <F3> <ESC>:call LoadSession()<CR> 
""let s:sessionloaded = 0 
""function! LoadSession() 
""    setlocal modifiable
""    source session.vim 
""    let s:sessionloaded = 1 
""endfunction 
""function! SaveSession() 
""    if s:sessionloaded == 1 
""        mksession! 
""    end 
""endfunction 
""autocmd VimLeave * call SaveSession() 
"
"let g:pydiction_location = '~/.vim/vimfiles/complete-dict'
"
""TODO add abrivations
"set tags=~\tags
"" Display function name in status bar:
"let g:ctags_statusline=1
"" Automatically start script
"let generate_tags=1
"" Displays taglist results in a vertical window:
"let Tlist_Use_Horiz_Window=0
"" Shorter commands to toggle Taglist display
"nnoremap TT :TlistToggle<CR>
"map <F4> :TlistToggle<CR>
"" Various Taglist diplay config:
"let Tlist_Use_Right_Window = 1
"let Tlist_Compact_Format = 0
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_GainFocus_On_ToggleOpen = 0
"let Tlist_File_Fold_Auto_Close = 1
"
"au BufWritePost *.py !pyflakes %
"
""FIXME it doesn't work
"if has("python")
"
"    " pydoc (displays documentation on function under corsor)
"    let g:pydoc_cmd = "/usr/bin/pydoc"
"
"    set switchbuf=useopen
"    function! ShowPyDoc(name, type)
"        if !exists('g:pydoc_cmd')
"            let g:pydoc_cmd = 'pydoc'
"        endif
"        if bufnr("__doc__") >0
"                exe "sb __doc__"
"        else
"                exe 'split __doc__'
"        endif
"        setlocal noswapfile
"        set buftype=nofile
"        setlocal modifiable
"        normal ggdG
"        let s:name2 = substitute(a:name, '(.*', '', 'g' )
"        if a:type==1
"            execute  "silent read ! " g:pydoc_cmd . " " . s:name2 
"        else 
"            execute  "silent read ! ".g:pydoc_cmd. " -k " . s:name2 
"        endif	
"        setlocal nomodified
"        set filetype=man
"        normal 1G
"     if !exists('g:pydoc_highlight')
"            let g:pydoc_highlight = 1
"        endif
"      if g:pydoc_highlight ==1
"            call Highlight(s:name2)
"        endif	
"    endfunction
"
"
"    function! Highlight(name)
"        exe "sb __doc__"
"        set filetype=man
"        syn on
"        exe 'syntax keyword pydoc '.s:name2
"        hi pydoc gui=reverse
"
"    endfunction
"
"    "mappings
"    map  <leader>pw :call ShowPyDoc('<C-R><C-W>', 1)<CR> 
"    map  <leader>pW :call ShowPyDoc('<C-R><C-A>', 1)<CR> 
"    map  <S-K> :call ShowPyDoc('<C-R><C-W>', 1)<CR> 
"    map  <C-S-K> :call ShowPyDoc('<C-R><C-A>', 1)<CR> 
"
"    "commands
"    command! -nargs=1 Pydoc :call ShowPyDoc('<args>', 1)
"    command! -nargs=*  PydocSearch :call ShowPyDoc('<args>', 0)
"
"    "end of pydoc (displays documentation on function under corsor)
"
"endif "has("python")
"
"map  <F6>   :NERDTreeToggle<CR>
"map  <S-F6> :NERDTree 
""map  <F5>   :mks session.vim<CR>
"
"" How to behave in Diff mode TODO check if better options
"if &diff
"    set co=171
"    set equalalways
"    "Option settings for diff mode (diffopt - dip):
"    " filler    - Show filler lines
"    " Context   - lines between a change and a fold
"    " icase     - Ignore changes in case of text
"    " iwhite    - Ignore changes in amount of white space
"    set dip=filler,iwhite,icase
"
"endif
"
"set stl=%1*(%n)\ %2*%F\ %1*%y%w%m%r%=\ \ \ %2*Row=%l\ Col=%c\%V%3*\ %P%*
"
"autocmd BufNewFile weekly*.txt call InsertWeeklyPackage()
"
"function! InsertWeeklyPackage() 
"    let dir = getcwd() 
"    let result = append(0, "-------------------------------------------------------------------------")     
"    let result = append(1, "-------------------------------------------------------------------------") 
"    let filename = expand("%") 
"    let result = append(2, "File name    : " . filename ) 
"    let result = append(3, "Title        : Weekly report") 
"    let result = append(4, "Project      : UNICORN") 
"    let result = append(5, "Developers   : Doron Gombosh ") 
"    let date = strftime("%a %b %d, %Y  %I:%M%p")
"    let result = append(6, "Created      : " . date) 
"    let result = append(7, "Description  : ") 
"    let result = append(8, "Notes        : ") 
"    let result = append(9, "---------------------------------------------------------------------------") 
"    let result = append(10, "Copyright 2011 (c) Siverge Networks") 
"    let result = append(11, "---------------------------------------------------------------------------*/")
"    let result = append(12, "")
"    let result = append(13, "Sunday:")
"    let result = append(14, "")
"    let result = append(15, "Monday:")
"    let result = append(16, "")
"    let result = append(17, "Tuesday:")
"    let result = append(18, "")
"    let result = append(19, "Wednesday:")
"    let result = append(20, "")
"    let result = append(21, "Thursday:")
"    let result = append(22, "")
"  
"endfunction
"
"" Make Shift-Arrow select like in Solaris
"map! <S-C-Left> <Right><Esc>vb<Left><Insert>
"map! <S-C-Right> <Right><Esc>ve<Right><Insert>
"map! <S-Left> <Right><Esc>v<Left><Insert>
"map! <S-Right> <Right><Esc>v<Right><Insert>
"map! <S-Up> <Esc>v<Up><Insert>
"map! <S-Down> <Esc>v<Down><Insert>
"map <S-C-Left> <Right><Esc>vb<Left>
"map <S-C-Right> <Esc>vw<Right>
"map <S-Left> <Right><Esc>v<Left>
"map <S-Right> <Esc>v<Right>
"map <S-Up> <Esc>v<Up>
"map <S-Down> <Esc>v<Down>
"
"if has("python")
"function! Doron()
"python << endpython
"import vim
"def doron():
"   (row, col) = vim.current.window.cursor
"   row = row
"   lines = []
"   max_len_line = 0
"   max_len_first = 0
"   max_len_second = 0
"   i = row
"   while True:
"      print i
"      line = vim.current.buffer[i].replace("\t"," ").strip()
"      if line:
"         while "  " in line:
"            line = line.replace("  "," ")
"
"         line = line.split(" ")
"         if len(line) < 2:
"            break
"
"         lines.append(line)
"         if len(line) > max_len_line:
"            max_len_line = len(line)
"
"         if len(line[0]) > max_len_first:
"            max_len_first = len(line[0])
"
"         if len(line) > 2 and len(line[1]) > max_len_second:
"            max_len_second = len(line[1])
"
"         i += 1
"      else:
"         break
"
"   for i in range(len(lines)):
"      white_spaces1 = 1 + max_len_first - len(lines[i][0])
"      white_spaces2 = 1 + max_len_second - len(lines[i][1])
"      print white_spaces1,white_spaces2,max_len_first,max_len_second
"      if max_len_line == 2:      
"         vim.current.buffer[row] = "\t"+lines[i][0]+white_spaces1*" "+lines[i][1]
"      elif max_len_line >= 3:
"         if len(lines[i]) == 3:
"            vim.current.buffer[row] = "\t"+lines[i][0]+white_spaces1*" "+lines[i][1]+white_spaces2*" "+lines[i][2]
"         elif len(lines[i]) == 2:
"            vim.current.buffer[row] = "\t"+lines[i][0]+white_spaces1*" "+(max_len_second+1)*" "+lines[i][1]
"         else:
"            vim.current.buffer[row] = "\t"+lines[i][0]+white_spaces1*" "+lines[i][1]+white_spaces2*" "+lines[i][2]+" ".join(lines[i][3:])
"
"      row += 1
"
"doron()
"endpython
"endfunction
"
"function! CP1()
"python << endpython
"import vim
"def cp1():
"    list_of_vars = []
"    max_var_size = 0    
"    (row, col) = vim.current.window.cursor
"    for i in range(row):
"        line = vim.current.buffer[i].split("//")[0]
"        if "_p1" in line:
"            line = line.replace("\t"," ").split("_p1")
"            for j in range(len(line)-1):
"                var_name = line[j].split(" ")[-1]
"                var_name = var_name.replace("(","").replace("&","").replace("|","").replace("~","").replace("{","")
"                if var_name not in list_of_vars:
"                   range_dec = "not_found"  
"                   for new_scan_i in range(row):
"                      new_scan_line = vim.current.buffer[new_scan_i]
"                      if var_name in new_scan_line and (("input" in new_scan_line) or ("output" in new_scan_line) or ("reg" in new_scan_line) or ("wire" in new_scan_line)):
"                         if "[" in new_scan_line:
"                            range_dec = "["+new_scan_line.split("[")[1].split("]")[0]+"]"
"                         else:
"                            range_dec = ""
"                         break
"                     
"                   if range_dec == "not_found":
"                      print "can't find declaration for ",var_name
"                      return
"
"                   if len(var_name)+len(range_dec) > max_var_size:
"                      max_var_size = len(var_name)+len(range_dec)
"
"                   list_of_vars.append([var_name,range_dec])
"                else:
"                    continue
"        else:
"            continue
"
"    vim.current.buffer.append("\talways @(posedge sclk or negedge sclk_rst_n)")
"    vim.current.buffer.append("\tbegin")
"    vim.current.buffer.append("\t\tif (~sclk_rst_n)")
"    vim.current.buffer.append("\t\tbegin")
"    for var in list_of_vars:
"        white_spaces = max_var_size - len(var[0]) - len(var[1]) + 4
"        vim.current.buffer.append("\t\t\t"+var[0]+"_p1"+var[1]+white_spaces*" "+"<=\t`RDEL 1'b0;")
"
"    vim.current.buffer.append("\t\tend")
"    vim.current.buffer.append("\t\telse")
"    vim.current.buffer.append("\t\tbegin")
"    for var in list_of_vars:
"        white_spaces = max_var_size - len(var[0]) - len(var[1]) + 4
"        vim.current.buffer.append("\t\t\t"+var[0]+"_p1"+var[1]+white_spaces*" "+"<=\t`RDEL "+var[0]+var[1]+";")
"
"    vim.current.buffer.append("\t\tend")
"    vim.current.buffer.append("\tend")
"
"cp1()
"endpython
"endfunction
"
"function! CP2()
"python << endpython
"import vim
"def cp2():
"    list_of_vars = []
"    max_var_size = 0
"    (row, col) = vim.current.window.cursor
"    for i in range(row):
"        line = vim.current.buffer[i].split("//")[0]
"        if "_p2" in line:
"            line = line.replace("\t"," ").split("_p2")
"            for j in range(len(line)-1):
"                var_name = line[j].split(" ")[-1]
"                var_name = var_name.replace("(","").replace("&","").replace("|","").replace("~","").replace("{","")
"                if var_name not in list_of_vars:
"                   range_dec = "not_found"
"                   for new_scan_i in range(row):
"                      new_scan_line = vim.current.buffer[new_scan_i]
"                      if var_name in new_scan_line and (("input" in new_scan_line) or ("output" in new_scan_line) or ("reg" in new_scan_line) or ("wire" in new_scan_line)):
"                         if "[" in new_scan_line:
"                            range_dec = "["+new_scan_line.split("[")[1].split("]")[0]+"]"
"                         else:
"                            range_dec = ""
"                         break
"                     
"                   if range_dec == "not_found":
"                      print "can't find declaration for ",var_name
"                      return
"
"                   if len(var_name)+len(range_dec) > max_var_size:
"                      max_var_size = len(var_name)+len(range_dec)
"
"                   list_of_vars.append([var_name,range_dec])
"                else:
"                   continue
"        else:
"            continue
"
"    vim.current.buffer.append("\talways @(posedge sclk or negedge sclk_rst_n)")
"    vim.current.buffer.append("\tbegin")
"    vim.current.buffer.append("\t\tif (~sclk_rst_n)")
"    vim.current.buffer.append("\t\tbegin")
"    for var in list_of_vars:
"        white_spaces = max_var_size - len(var[0]) - len(var[1]) + 4
"        vim.current.buffer.append("\t\t\t"+var[0]+"_p2"+var[1]+white_spaces*" "+"<=\t`RDEL 1'b0;")
"
"    vim.current.buffer.append("\t\tend")
"    vim.current.buffer.append("\t\telse")
"    vim.current.buffer.append("\t\tbegin")
"    for var in list_of_vars:
"        white_spaces = max_var_size - len(var[0]) - len(var[1]) + 4       
"        vim.current.buffer.append("\t\t\t"+var[0]+"_p2"+var[1]+white_spaces*" "+"<=\t`RDEL "+var[0]+"_p1"+var[1]+";")
"
"    vim.current.buffer.append("\t\tend")
"    vim.current.buffer.append("\tend")
"
"cp2()
"endpython
"endfunction
"endif
