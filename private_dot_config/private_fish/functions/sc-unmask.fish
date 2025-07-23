function sc-unmask --wraps='sudo systemctl unmask' --description 'alias sc-unmask=sudo systemctl unmask'
  sudo systemctl unmask $argv
        
end
