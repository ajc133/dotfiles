function sc-daemon-reexec --wraps='sudo systemctl daemon-reexec' --description 'alias sc-daemon-reexec=sudo systemctl daemon-reexec'
  sudo systemctl daemon-reexec $argv
        
end
