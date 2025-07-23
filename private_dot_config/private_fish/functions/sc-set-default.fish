function sc-set-default --wraps='sudo systemctl set-default' --description 'alias sc-set-default=sudo systemctl set-default'
  sudo systemctl set-default $argv
        
end
