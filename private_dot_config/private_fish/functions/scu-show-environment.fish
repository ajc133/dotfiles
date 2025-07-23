function scu-show-environment --wraps='systemctl --user show-environment' --description 'alias scu-show-environment=systemctl --user show-environment'
  systemctl --user show-environment $argv
        
end
