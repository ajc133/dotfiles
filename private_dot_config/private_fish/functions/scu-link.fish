function scu-link --wraps='systemctl --user link' --description 'alias scu-link=systemctl --user link'
  systemctl --user link $argv
        
end
