function agrep --wraps='alias | grep -i' --description 'alias agrep=alias | grep -i'
  alias | grep -i $argv
        
end
