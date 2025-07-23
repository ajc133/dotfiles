function scu-list-jobs --wraps='systemctl --user list-jobs' --description 'alias scu-list-jobs=systemctl --user list-jobs'
  systemctl --user list-jobs $argv
        
end
