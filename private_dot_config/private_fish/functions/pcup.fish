function pcup --wraps='podman-compose up' --description 'alias pcup=podman-compose up'
  podman-compose up $argv
        
end
