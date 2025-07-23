function sc-suspend --wraps='systemctl suspend' --description 'alias sc-suspend=systemctl suspend'
  systemctl suspend $argv
        
end
