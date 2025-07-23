function pr --wraps='podman container run' --description 'alias pr=podman container run'
  podman container run $argv
        
end
