function scu-edit --wraps='systemctl --user edit' --description 'alias scu-edit=systemctl --user edit'
  systemctl --user edit $argv
        
end
