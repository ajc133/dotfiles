function scu-default --wraps='systemctl --user default' --description 'alias scu-default=systemctl --user default'
  systemctl --user default $argv
        
end
