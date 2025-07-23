function pit --wraps='podman image tag' --description 'alias pit=podman image tag'
  podman image tag $argv
        
end
