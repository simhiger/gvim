" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif


syntax match f_fileEnvVar "\$\k\+" nextgroup=f_fileValue
syntax match f_fileEnvVar "\${\k\+}" nextgroup=f_fileValue
syntax match f_fileDef "+define+" nextgroup=f_fileDefVal
syntax match f_fileDefVal "\k\+" contained 
syntax match f_fileKeyWord "[\-+]\k\+[ +]" nextgroup=f_fileValue
syntax match f_fileKeyWord "-\k\+"
syntax match f_fileKeyWord "-\k\+=" nextgroup=f_fileValue
syntax match f_fileKeyWord "+\k\+=" nextgroup=f_fileValue
syntax match f_fileKeyWord "+\k\+ \+" nextgroup=f_fileValue
syntax match f_fileKeyWord "-\k\+ \+" nextgroup=f_fileValue
syntax match f_fileValue "[^\-^+].*" contained
syn match   f_fileComment     "//.*" oneline

hi def link f_fileEnvVar Type
hi def link f_fileDef Define
hi def link f_fileDefVal Constant
hi def link f_fileKeyWord Keyword
hi def link f_fileValue String
hi def link f_fileComment Comment

let b:current_syntax = 'f_file'
