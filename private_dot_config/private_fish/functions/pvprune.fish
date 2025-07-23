function pvprune --wraps='podman volume prune' --description 'alias pvprune=podman volume prune'
  podman volume prune $argv
        
end
