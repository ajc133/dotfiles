function scu-list-sockets --wraps='systemctl --user list-sockets' --description 'alias scu-list-sockets=systemctl --user list-sockets'
  systemctl --user list-sockets $argv
        
end
