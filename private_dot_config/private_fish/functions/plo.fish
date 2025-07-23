function plo --wraps='podman container logs' --description 'alias plo=podman container logs'
  podman container logs $argv
        
end
