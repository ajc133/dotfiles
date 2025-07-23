function scu-load --wraps='systemctl --user load' --description 'alias scu-load=systemctl --user load'
  systemctl --user load $argv
        
end
