function pxc --wraps='podman container exec' --description 'alias pxc=podman container exec'
  podman container exec $argv
        
end
