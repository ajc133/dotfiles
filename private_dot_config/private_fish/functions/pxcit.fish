function pxcit --wraps='podman container exec --interactive --tty' --description 'alias pxcit=podman container exec --interactive --tty'
  podman container exec --interactive --tty $argv
        
end
