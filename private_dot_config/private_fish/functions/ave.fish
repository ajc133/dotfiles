function ave --wraps='ansible-vault edit' --description 'alias ave=ansible-vault edit'
  ansible-vault edit $argv
        
end
