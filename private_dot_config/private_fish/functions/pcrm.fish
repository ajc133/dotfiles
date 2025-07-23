function pcrm --wraps='podman-compose rm' --description 'alias pcrm=podman-compose rm'
  podman-compose rm $argv
        
end
