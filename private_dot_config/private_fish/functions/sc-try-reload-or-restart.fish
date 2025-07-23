function sc-try-reload-or-restart --wraps='sudo systemctl try-reload-or-restart' --description 'alias sc-try-reload-or-restart=sudo systemctl try-reload-or-restart'
  sudo systemctl try-reload-or-restart $argv
        
end
