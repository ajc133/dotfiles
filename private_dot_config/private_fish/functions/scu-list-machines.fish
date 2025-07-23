function scu-list-machines --wraps='systemctl --user list-machines' --description 'alias scu-list-machines=systemctl --user list-machines'
  systemctl --user list-machines $argv
        
end
