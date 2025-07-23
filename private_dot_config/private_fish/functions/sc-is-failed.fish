function sc-is-failed --wraps='systemctl is-failed' --description 'alias sc-is-failed=systemctl is-failed'
  systemctl is-failed $argv
        
end
