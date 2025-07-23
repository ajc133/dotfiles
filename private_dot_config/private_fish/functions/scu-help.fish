function scu-help --wraps='systemctl --user help' --description 'alias scu-help=systemctl --user help'
  systemctl --user help $argv
        
end
