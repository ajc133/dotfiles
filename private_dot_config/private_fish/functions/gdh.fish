function gdh --wraps='git diff HEAD^' --description 'alias gdh=git diff HEAD^'
  git diff HEAD^ $argv
        
end
