function sc-halt --wraps='sudo systemctl halt' --description 'alias sc-halt=sudo systemctl halt'
  sudo systemctl halt $argv
        
end
