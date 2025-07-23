function scu-cancel --wraps='systemctl --user cancel' --description 'alias scu-cancel=systemctl --user cancel'
  systemctl --user cancel $argv
        
end
