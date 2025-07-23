function pcupd --wraps='podman-compose up -d' --description 'alias pcupd=podman-compose up -d'
  podman-compose up -d $argv
        
end
