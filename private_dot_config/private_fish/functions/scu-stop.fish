function scu-stop --wraps='systemctl --user stop' --description 'alias scu-stop=systemctl --user stop'
  systemctl --user stop $argv
        
end
