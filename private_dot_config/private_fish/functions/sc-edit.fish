function sc-edit --wraps='sudo systemctl edit' --description 'alias sc-edit=sudo systemctl edit'
  sudo systemctl edit $argv
        
end
