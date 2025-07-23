function sc-list-machines --wraps='sudo systemctl list-machines' --description 'alias sc-list-machines=sudo systemctl list-machines'
  sudo systemctl list-machines $argv
        
end
