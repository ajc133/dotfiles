function sc-list-jobs --wraps='systemctl list-jobs' --description 'alias sc-list-jobs=systemctl list-jobs'
  systemctl list-jobs $argv
        
end
