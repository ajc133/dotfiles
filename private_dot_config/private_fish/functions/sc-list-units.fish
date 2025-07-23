function sc-list-units --wraps='systemctl list-units' --description 'alias sc-list-units=systemctl list-units'
  systemctl list-units $argv
        
end
