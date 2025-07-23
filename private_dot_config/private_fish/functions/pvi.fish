function pvi --wraps='podman volume inspect' --description 'alias pvi=podman volume inspect'
  podman volume inspect $argv
        
end
