function sc-show-environment --wraps='systemctl show-environment' --description 'alias sc-show-environment=systemctl show-environment'
  systemctl show-environment $argv
        
end
