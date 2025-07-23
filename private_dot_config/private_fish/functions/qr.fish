function qr --wraps='qrencode -t ansiutf8 "$1"' --description 'alias qr qrencode -t ansiutf8 "$1"'
  qrencode -t ansiutf8 "$1" $argv
        
end
