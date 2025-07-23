function sc-list-timers --wraps='systemctl list-timers' --description 'alias sc-list-timers=systemctl list-timers'
  systemctl list-timers $argv
        
end
