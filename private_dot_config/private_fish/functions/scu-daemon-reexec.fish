function scu-daemon-reexec --wraps='systemctl --user daemon-reexec' --description 'alias scu-daemon-reexec=systemctl --user daemon-reexec'
  systemctl --user daemon-reexec $argv
        
end
