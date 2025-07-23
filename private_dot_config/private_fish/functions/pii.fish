function pii --wraps='podman image inspect' --description 'alias pii=podman image inspect'
  podman image inspect $argv
        
end
