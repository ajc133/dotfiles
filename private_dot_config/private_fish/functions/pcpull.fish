function pcpull --wraps='podman-compose pull' --description 'alias pcpull=podman-compose pull'
  podman-compose pull $argv
        
end
