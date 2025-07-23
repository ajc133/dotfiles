function scu-add-requires --wraps='systemctl --user add-requires' --description 'alias scu-add-requires=systemctl --user add-requires'
  systemctl --user add-requires $argv
        
end
