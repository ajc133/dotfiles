function sc-try-restart --wraps='sudo systemctl try-restart' --description 'alias sc-try-restart=sudo systemctl try-restart'
  sudo systemctl try-restart $argv
        
end
