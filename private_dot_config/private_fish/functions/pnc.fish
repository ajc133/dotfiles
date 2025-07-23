function pnc --wraps='podman network create' --description 'alias pnc=podman network create'
  podman network create $argv
        
end
