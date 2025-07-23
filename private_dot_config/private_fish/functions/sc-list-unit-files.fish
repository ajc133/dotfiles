function sc-list-unit-files --wraps='systemctl list-unit-files' --description 'alias sc-list-unit-files=systemctl list-unit-files'
  systemctl list-unit-files $argv
        
end
