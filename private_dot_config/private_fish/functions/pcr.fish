function pcr --wraps='podman-compose run' --description 'alias pcr=podman-compose run'
  podman-compose run $argv
        
end
