function scu-is-active --wraps='systemctl --user is-active' --description 'alias scu-is-active=systemctl --user is-active'
  systemctl --user is-active $argv
        
end
