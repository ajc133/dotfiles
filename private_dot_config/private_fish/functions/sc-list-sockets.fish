function sc-list-sockets --wraps='systemctl list-sockets' --description 'alias sc-list-sockets=systemctl list-sockets'
  systemctl list-sockets $argv
        
end
