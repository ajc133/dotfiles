function vimrg --wraps="rg -l 'vim' | xargs nvim" --description "alias vimrg=rg -l 'vim' | xargs nvim"
  rg -l 'vim' | xargs nvim $argv
        
end
