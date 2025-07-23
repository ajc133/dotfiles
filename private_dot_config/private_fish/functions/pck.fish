function pck --wraps='podman-compose kill' --description 'alias pck=podman-compose kill'
  podman-compose kill $argv
        
end
