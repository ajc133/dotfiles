function sc-rescue --wraps='sudo systemctl rescue' --description 'alias sc-rescue=sudo systemctl rescue'
  sudo systemctl rescue $argv
        
end
