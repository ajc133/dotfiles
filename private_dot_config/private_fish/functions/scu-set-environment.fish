function scu-set-environment --wraps='systemctl --user set-environment' --description 'alias scu-set-environment=systemctl --user set-environment'
  systemctl --user set-environment $argv
        
end
