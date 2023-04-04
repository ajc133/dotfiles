" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.lua.tmpl setfiletype lua
  au! BufRead,BufNewFile *.sh.tmpl setfiletype bash
augroup END
