function pclsa --wraps='podman container ls --all' --description 'alias pclsa=podman container ls --all'
  podman container ls --all $argv
        
end
