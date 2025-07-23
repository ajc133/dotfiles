function sc-reload-or-restart --wraps='sudo systemctl reload-or-restart' --description 'alias sc-reload-or-restart=sudo systemctl reload-or-restart'
  sudo systemctl reload-or-restart $argv
        
end
