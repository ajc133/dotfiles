function pclf --wraps='podman-compose logs -f' --description 'alias pclf=podman-compose logs -f'
  podman-compose logs -f $argv
        
end
