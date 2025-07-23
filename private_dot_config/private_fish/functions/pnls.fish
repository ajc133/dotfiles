function pnls --wraps='podman network ls' --description 'alias pnls=podman network ls'
  podman network ls $argv
        
end
