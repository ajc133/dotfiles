function scu-reload --wraps='systemctl --user reload' --description 'alias scu-reload=systemctl --user reload'
  systemctl --user reload $argv
        
end
