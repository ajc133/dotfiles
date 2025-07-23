function scu-set-property --wraps='systemctl --user set-property' --description 'alias scu-set-property=systemctl --user set-property'
  systemctl --user set-property $argv
        
end
