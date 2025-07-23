function pnrm --wraps='podman network rm' --description 'alias pnrm=podman network rm'
  podman network rm $argv
        
end
