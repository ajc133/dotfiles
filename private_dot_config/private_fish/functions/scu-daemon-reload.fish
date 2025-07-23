function scu-daemon-reload --wraps='systemctl --user daemon-reload' --description 'alias scu-daemon-reload=systemctl --user daemon-reload'
  systemctl --user daemon-reload $argv
        
end
