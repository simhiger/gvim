" Vim syntax file
" Language:	vManager VSIFs1
" Maintainer:	Doron Gombosh
" Last Update: 18-Sep-2006

" Remove any old syntax stuff hanging around
"syn clear
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
set iskeyword=@,48-57,_,192-255,+,-,?
set tabstop=4

" autocmd BufNewFile *.e   0r $VIM/.vsif.e

" A bunch of useful vsif keywords
syn keyword vsifStatement   group run session test
syn keyword vsifFields      top_dir output_mode pre_session_script post_session_script
syn keyword vsifFields      sve_name pre_run_script run_mode 
syn keyword vsifFields      compile_mode specman_mode incremental_compile run_test
syn keyword vsifFields      count pre_commands timeout test_command top_files 

syn keyword vsifOptions     interactive batch
syn keyword vsifOptions     interperted compiled
syn keyword vsifOptions     full_compile no_compile specman_only verilog_only
syn keyword vsifOptions     terminal log_only
syn keyword vsifOptions     yes no

syn match   vsifNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   vsifNumber "0[bB]\s*[0-1_xXzZ?]\+\>"
syn match   vsifNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   vsifNumber "0[oO]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   vsifNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   vsifNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   vsifNumber "0[xX]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   vsifNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"


syn match   vsifComment     "//.*" oneline
syn match   vsifSection "^.*:"
syn region  vsifString start=+"+  end=+"+  

"hi Constant 		term=underline ctermfg=DarkRed gui=bold guifg=SeaGreen
"hi vsifStatement    	ctermfg=DarkRed gui=bold guifg=DarkRed
"hi vsifFields      ctermfg=Darkgreen guifg=Darkgreen
"hi vsifOptions    	ctermfg=darkmagenta  gui=bold guifg=darkmagenta 
"hi vsifNumber       	ctermfg=white gui=bold guifg=white
"hi vsifComment     	ctermfg=Blue guifg=Blue
"hi vsifString       	ctermfg=lightBlue guibg=lightcyan guifg=black

hi vsifSection      ctermfg=lightBlue guifg=Yellow
hi vsifConditional	ctermfg=brown  guifg=brown 
hi vsifRepeat    	ctermfg=DarkMagenta  gui=bold guifg=DarkMagenta 
hi vsifString       	ctermfg=lightBlue guifg=LightYellow
hi vsifComment     	ctermbg=White ctermfg=Blue guifg=LightBlue
"hi vsifComment     	ctermfg=Blue guifg=Blue
"hi vsifComment     	term=reverse ctermbg=Yellow guibg=Yellow guifg=Black
hi link vsifConstant        Constant
hi vsifNumber       	ctermfg=black gui=bold guifg=LightCyan
hi vsifCompare      	ctermfg=darkMagenta gui=bold guifg=darkMagenta
hi vsifOperator     	ctermfg=DarkMagenta gui=bold guifg=DarkMagenta
hi vsifLogical      	ctermfg=red  guifg=red
hi vsifStatement    	ctermfg=Magenta gui=bold guifg=Magenta
hi vsifHDL       	term=reverse ctermfg=lightgreen guibg=lightgreen guifg=black
hi vsifMethod       	ctermfg=darkblue gui=bold  guifg=darkblue 
hi link vsifInclude         vsifDefine
hi vsifSignal        term=reverse ctermbg=Gray ctermfg=black guibg=Gray guifg=black 
hi vsifBoolean	term=bold ctermfg=DarkGreen gui=bold guifg=DarkGreen
hi vsifSpecial       ctermfg=DarkGreen  guifg=DarkGreen
hi vsifTemporal      ctermfg=Darkgreen guifg=Darkgreen
hi vsifDefine       	ctermfg=magenta guifg=magenta 

let b:current_syntax = "vsif"


