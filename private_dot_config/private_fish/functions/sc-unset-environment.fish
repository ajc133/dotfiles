function sc-unset-environment --wraps='sudo systemctl unset-environment' --description 'alias sc-unset-environment=sudo systemctl unset-environment'
  sudo systemctl unset-environment $argv
        
end
