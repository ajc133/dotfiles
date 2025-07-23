function hgrep --wraps='history | grep -i' --description 'alias hgrep=history | grep -i'
  history | grep -i $argv
        
end
