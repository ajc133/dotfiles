function pstp --wraps='podman container stop' --description 'alias pstp=podman container stop'
  podman container stop $argv
        
end
