function scu-import-environment --wraps='systemctl --user import-environment' --description 'alias scu-import-environment=systemctl --user import-environment'
  systemctl --user import-environment $argv
        
end
