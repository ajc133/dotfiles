function sc-reenable --wraps='sudo systemctl reenable' --description 'alias sc-reenable=sudo systemctl reenable'
  sudo systemctl reenable $argv
        
end
