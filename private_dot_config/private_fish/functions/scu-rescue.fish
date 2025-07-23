function scu-rescue --wraps='systemctl --user rescue' --description 'alias scu-rescue=systemctl --user rescue'
  systemctl --user rescue $argv
        
end
