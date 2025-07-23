function avd --wraps='ansible-vault decrypt' --description 'alias avd=ansible-vault decrypt'
  ansible-vault decrypt $argv
        
end
