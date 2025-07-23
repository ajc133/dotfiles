function prm --wraps='podman container rm' --description 'alias prm=podman container rm'
  podman container rm $argv
        
end
