function scu-isolate --wraps='systemctl --user isolate' --description 'alias scu-isolate=systemctl --user isolate'
  systemctl --user isolate $argv
        
end
