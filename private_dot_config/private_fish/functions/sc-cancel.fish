function sc-cancel --wraps='sudo systemctl cancel' --description 'alias sc-cancel=sudo systemctl cancel'
  sudo systemctl cancel $argv
        
end
