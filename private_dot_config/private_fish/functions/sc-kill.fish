function sc-kill --wraps='sudo systemctl kill' --description 'alias sc-kill=sudo systemctl kill'
  sudo systemctl kill $argv
        
end
