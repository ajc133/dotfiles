function pcupb --wraps='podman-compose up --build' --description 'alias pcupb=podman-compose up --build'
  podman-compose up --build $argv
        
end
