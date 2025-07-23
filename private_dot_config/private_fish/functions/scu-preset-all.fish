function scu-preset-all --wraps='systemctl --user preset-all' --description 'alias scu-preset-all=systemctl --user preset-all'
  systemctl --user preset-all $argv
        
end
