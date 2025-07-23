function scu-reset-failed --wraps='systemctl --user reset-failed' --description 'alias scu-reset-failed=systemctl --user reset-failed'
  systemctl --user reset-failed $argv
        
end
