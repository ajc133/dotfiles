function prs --wraps='podman container restart' --description 'alias prs=podman container restart'
  podman container restart $argv
        
end
