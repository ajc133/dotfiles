function scu-revert --wraps='systemctl --user revert' --description 'alias scu-revert=systemctl --user revert'
  systemctl --user revert $argv
        
end
