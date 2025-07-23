function mbr --wraps='make build && make run' --description 'alias mbr=make build && make run'
  make build && make run $argv
        
end
