function sc-poweroff --wraps='systemctl poweroff' --description 'alias sc-poweroff=systemctl poweroff'
  systemctl poweroff $argv
        
end
