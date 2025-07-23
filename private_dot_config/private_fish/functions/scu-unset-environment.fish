function scu-unset-environment --wraps='systemctl --user unset-environment' --description 'alias scu-unset-environment=systemctl --user unset-environment'
  systemctl --user unset-environment $argv
        
end
