function sc-is-active --wraps='systemctl is-active' --description 'alias sc-is-active=systemctl is-active'
  systemctl is-active $argv
        
end
