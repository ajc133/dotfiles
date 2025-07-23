function pib --wraps='podman image build' --description 'alias pib=podman image build'
  podman image build $argv
        
end
