function scu-unmask --wraps='systemctl --user unmask' --description 'alias scu-unmask=systemctl --user unmask'
  systemctl --user unmask $argv
        
end
