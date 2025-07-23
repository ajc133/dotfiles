function scu-add-wants --wraps='systemctl --user add-wants' --description 'alias scu-add-wants=systemctl --user add-wants'
  systemctl --user add-wants $argv
        
end
