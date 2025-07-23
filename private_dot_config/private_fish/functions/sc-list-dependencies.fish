function sc-list-dependencies --wraps='systemctl list-dependencies' --description 'alias sc-list-dependencies=systemctl list-dependencies'
  systemctl list-dependencies $argv
        
end
