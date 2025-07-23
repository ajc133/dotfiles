function sc-reload --wraps='sudo systemctl reload' --description 'alias sc-reload=sudo systemctl reload'
  sudo systemctl reload $argv
        
end
