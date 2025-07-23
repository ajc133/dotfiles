function sc-get-default --wraps='systemctl get-default' --description 'alias sc-get-default=systemctl get-default'
  systemctl get-default $argv
        
end
