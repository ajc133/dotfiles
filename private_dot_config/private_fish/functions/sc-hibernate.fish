function sc-hibernate --wraps='systemctl hibernate' --description 'alias sc-hibernate=systemctl hibernate'
  systemctl hibernate $argv
        
end
