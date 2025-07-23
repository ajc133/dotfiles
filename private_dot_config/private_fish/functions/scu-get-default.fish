function scu-get-default --wraps='systemctl --user get-default' --description 'alias scu-get-default=systemctl --user get-default'
  systemctl --user get-default $argv
        
end
