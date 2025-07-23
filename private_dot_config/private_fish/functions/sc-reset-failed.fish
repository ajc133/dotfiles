function sc-reset-failed --wraps='sudo systemctl reset-failed' --description 'alias sc-reset-failed=sudo systemctl reset-failed'
  sudo systemctl reset-failed $argv
        
end
