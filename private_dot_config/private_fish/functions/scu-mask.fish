function scu-mask --wraps='systemctl --user mask' --description 'alias scu-mask=systemctl --user mask'
  systemctl --user mask $argv
        
end
