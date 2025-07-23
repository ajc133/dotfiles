function pcupdb --wraps='podman-compose up -d --build' --description 'alias pcupdb=podman-compose up -d --build'
  podman-compose up -d --build $argv
        
end
