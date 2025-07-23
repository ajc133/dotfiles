function pcls --wraps='podman container ls' --description 'alias pcls=podman container ls'
  podman container ls $argv
        
end
