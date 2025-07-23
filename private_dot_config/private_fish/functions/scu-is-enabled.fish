function scu-is-enabled --wraps='systemctl --user is-enabled' --description 'alias scu-is-enabled=systemctl --user is-enabled'
  systemctl --user is-enabled $argv
        
end
