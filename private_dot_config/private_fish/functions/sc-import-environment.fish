function sc-import-environment --wraps='sudo systemctl import-environment' --description 'alias sc-import-environment=sudo systemctl import-environment'
  sudo systemctl import-environment $argv
        
end
