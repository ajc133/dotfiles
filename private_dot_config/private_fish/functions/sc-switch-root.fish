function sc-switch-root --wraps='sudo systemctl switch-root' --description 'alias sc-switch-root=sudo systemctl switch-root'
  sudo systemctl switch-root $argv
        
end
