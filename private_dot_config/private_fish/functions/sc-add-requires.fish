function sc-add-requires --wraps='sudo systemctl add-requires' --description 'alias sc-add-requires=sudo systemctl add-requires'
  sudo systemctl add-requires $argv
        
end
