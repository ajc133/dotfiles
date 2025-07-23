function pipu --wraps='podman image push' --description 'alias pipu=podman image push'
  podman image push $argv
        
end
