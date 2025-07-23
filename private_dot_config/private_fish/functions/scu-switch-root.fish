function scu-switch-root --wraps='systemctl --user switch-root' --description 'alias scu-switch-root=systemctl --user switch-root'
  systemctl --user switch-root $argv
        
end
