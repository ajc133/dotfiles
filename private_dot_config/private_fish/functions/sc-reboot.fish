function sc-reboot --wraps='systemctl reboot' --description 'alias sc-reboot=systemctl reboot'
  systemctl reboot $argv
        
end
