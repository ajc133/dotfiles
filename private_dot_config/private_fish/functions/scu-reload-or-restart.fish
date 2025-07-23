function scu-reload-or-restart --wraps='systemctl --user reload-or-restart' --description 'alias scu-reload-or-restart=systemctl --user reload-or-restart'
  systemctl --user reload-or-restart $argv
        
end
