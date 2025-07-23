function scu-try-reload-or-restart --wraps='systemctl --user try-reload-or-restart' --description 'alias scu-try-reload-or-restart=systemctl --user try-reload-or-restart'
  systemctl --user try-reload-or-restart $argv
        
end
