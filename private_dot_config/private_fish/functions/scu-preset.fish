function scu-preset --wraps='systemctl --user preset' --description 'alias scu-preset=systemctl --user preset'
  systemctl --user preset $argv
        
end
