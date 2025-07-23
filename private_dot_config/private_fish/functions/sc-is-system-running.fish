function sc-is-system-running --wraps='systemctl is-system-running' --description 'alias sc-is-system-running=systemctl is-system-running'
  systemctl is-system-running $argv
        
end
