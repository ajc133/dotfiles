function sc-isolate --wraps='sudo systemctl isolate' --description 'alias sc-isolate=sudo systemctl isolate'
  sudo systemctl isolate $argv
        
end
