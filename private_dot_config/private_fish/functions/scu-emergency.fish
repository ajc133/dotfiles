function scu-emergency --wraps='systemctl --user emergency' --description 'alias scu-emergency=systemctl --user emergency'
  systemctl --user emergency $argv
        
end
