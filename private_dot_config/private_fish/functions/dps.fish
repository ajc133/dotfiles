function dps --wraps='docker ps --format "{{.Names}}\\t{{.ID}}\\t{{.State}}\\t{{.Status}}" | column -t' --description 'alias dps=docker ps --format "{{.Names}}\\t{{.ID}}\\t{{.State}}\\t{{.Status}}" | column -t'
  docker ps --format "{{.Names}}\t{{.ID}}\t{{.State}}\t{{.Status}}" | column -t $argv
        
end
