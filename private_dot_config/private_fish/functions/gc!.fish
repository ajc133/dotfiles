function gc! --wraps='git commit --verbose --amend' --description 'alias gc!=git commit --verbose --amend'
  git commit --verbose --amend $argv
        
end
