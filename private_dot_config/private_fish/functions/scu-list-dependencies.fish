function scu-list-dependencies --wraps='systemctl --user list-dependencies' --description 'alias scu-list-dependencies=systemctl --user list-dependencies'
  systemctl --user list-dependencies $argv
        
end
