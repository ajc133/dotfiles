function scu-show --wraps='systemctl --user show' --description 'alias scu-show=systemctl --user show'
  systemctl --user show $argv
        
end
