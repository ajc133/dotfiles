function scu-kill --wraps='systemctl --user kill' --description 'alias scu-kill=systemctl --user kill'
  systemctl --user kill $argv
        
end
