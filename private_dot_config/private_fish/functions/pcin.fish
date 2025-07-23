function pcin --wraps='podman container inspect' --description 'alias pcin=podman container inspect'
  podman container inspect $argv
        
end
