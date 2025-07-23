function scu-set-default --wraps='systemctl --user set-default' --description 'alias scu-set-default=systemctl --user set-default'
  systemctl --user set-default $argv
        
end
