function sc-set-property --wraps='sudo systemctl set-property' --description 'alias sc-set-property=sudo systemctl set-property'
  sudo systemctl set-property $argv
        
end
