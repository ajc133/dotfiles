function scu-try-restart --wraps='systemctl --user try-restart' --description 'alias scu-try-restart=systemctl --user try-restart'
  systemctl --user try-restart $argv
        
end
