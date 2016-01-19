	" my filetype file
	if exists("did_load_filetypes")
	  finish
	endif
	augroup filetypedetect
     au! BufRead,BufNewFile *.vsif setfiletype vsif
     au! BufRead,BufNewFile *.f setfiletype f_file
	augroup END
