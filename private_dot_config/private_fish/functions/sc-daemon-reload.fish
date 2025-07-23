function sc-daemon-reload --wraps='sudo systemctl daemon-reload' --description 'alias sc-daemon-reload=sudo systemctl daemon-reload'
  sudo systemctl daemon-reload $argv
        
end
