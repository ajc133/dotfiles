function sc-add-wants --wraps='sudo systemctl add-wants' --description 'alias sc-add-wants=sudo systemctl add-wants'
  sudo systemctl add-wants $argv
        
end
