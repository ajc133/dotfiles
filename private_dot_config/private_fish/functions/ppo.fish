function ppo --wraps='podman container port' --description 'alias ppo=podman container port'
  podman container port $argv
        
end
