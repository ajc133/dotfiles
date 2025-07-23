function psta --wraps='podman stop $(podman ps --quiet)' --description 'alias psta=podman stop $(podman ps --quiet)'
  podman stop $(podman ps --quiet) $argv
        
end
