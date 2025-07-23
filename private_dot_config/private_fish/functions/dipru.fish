function dipru --wraps='docker image prune -a' --description 'alias dipru=docker image prune -a'
  docker image prune -a $argv
        
end
