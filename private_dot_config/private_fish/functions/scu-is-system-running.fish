function scu-is-system-running --wraps='systemctl --user is-system-running' --description 'alias scu-is-system-running=systemctl --user is-system-running'
  systemctl --user is-system-running $argv
        
end
