function sc-preset --wraps='sudo systemctl preset' --description 'alias sc-preset=sudo systemctl preset'
  sudo systemctl preset $argv
        
end
