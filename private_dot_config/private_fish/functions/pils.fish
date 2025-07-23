function pils --wraps='podman image ls' --description 'alias pils=podman image ls'
  podman image ls $argv
        
end
