function pni --wraps='podman network inspect' --description 'alias pni=podman network inspect'
  podman network inspect $argv
        
end
