function scu-list-timers --wraps='systemctl --user list-timers' --description 'alias scu-list-timers=systemctl --user list-timers'
  systemctl --user list-timers $argv
        
end
