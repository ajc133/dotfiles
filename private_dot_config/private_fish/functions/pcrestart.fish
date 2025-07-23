function pcrestart --wraps='podman-compose restart' --description 'alias pcrestart=podman-compose restart'
  podman-compose restart $argv
        
end
