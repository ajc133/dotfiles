function scu-list-unit-files --wraps='systemctl --user list-unit-files' --description 'alias scu-list-unit-files=systemctl --user list-unit-files'
  systemctl --user list-unit-files $argv
        
end
