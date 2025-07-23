function sc-emergency --wraps='sudo systemctl emergency' --description 'alias sc-emergency=sudo systemctl emergency'
  sudo systemctl emergency $argv
        
end
