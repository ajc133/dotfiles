function sc-failed --wraps='systemctl --failed' --description 'alias sc-failed=systemctl --failed'
  systemctl --failed $argv
        
end
