function scu-halt --wraps='systemctl --user halt' --description 'alias scu-halt=systemctl --user halt'
  systemctl --user halt $argv
        
end
