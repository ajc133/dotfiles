function sc-is-enabled --wraps='systemctl is-enabled' --description 'alias sc-is-enabled=systemctl is-enabled'
  systemctl is-enabled $argv
        
end
