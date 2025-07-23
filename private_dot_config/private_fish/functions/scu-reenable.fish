function scu-reenable --wraps='systemctl --user reenable' --description 'alias scu-reenable=systemctl --user reenable'
  systemctl --user reenable $argv
        
end
