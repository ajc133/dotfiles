function sc-kexec --wraps='sudo systemctl kexec' --description 'alias sc-kexec=sudo systemctl kexec'
  sudo systemctl kexec $argv
        
end
