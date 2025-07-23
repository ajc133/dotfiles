function scu-cat --wraps='systemctl --user cat' --description 'alias scu-cat=systemctl --user cat'
  systemctl --user cat $argv
        
end
