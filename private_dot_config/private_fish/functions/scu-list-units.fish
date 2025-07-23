function scu-list-units --wraps='systemctl --user list-units' --description 'alias scu-list-units=systemctl --user list-units'
  systemctl --user list-units $argv
        
end
