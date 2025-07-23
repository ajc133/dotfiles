function scu-failed --wraps='systemctl --user --failed' --description 'alias scu-failed=systemctl --user --failed'
  systemctl --user --failed $argv
        
end
