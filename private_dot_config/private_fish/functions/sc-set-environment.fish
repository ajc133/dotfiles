function sc-set-environment --wraps='sudo systemctl set-environment' --description 'alias sc-set-environment=sudo systemctl set-environment'
  sudo systemctl set-environment $argv
        
end
