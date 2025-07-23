function pirm --wraps='podman image rm' --description 'alias pirm=podman image rm'
  podman image rm $argv
        
end
