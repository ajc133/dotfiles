function sc-revert --wraps='sudo systemctl revert' --description 'alias sc-revert=sudo systemctl revert'
  sudo systemctl revert $argv
        
end
