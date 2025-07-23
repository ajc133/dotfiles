function scu-kexec --wraps='systemctl --user kexec' --description 'alias scu-kexec=systemctl --user kexec'
  systemctl --user kexec $argv
        
end
