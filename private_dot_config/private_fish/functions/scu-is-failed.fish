function scu-is-failed --wraps='systemctl --user is-failed' --description 'alias scu-is-failed=systemctl --user is-failed'
  systemctl --user is-failed $argv
        
end
