function sc-load --wraps='sudo systemctl load' --description 'alias sc-load=sudo systemctl load'
  sudo systemctl load $argv
        
end
