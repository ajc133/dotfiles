function prit --wraps='podman container run --interactive --tty' --description 'alias prit=podman container run --interactive --tty'
  podman container run --interactive --tty $argv
        
end
