function qr --description 'Make a QR code from input and print in terminal'
  qrencode -t ansiutf8 $argv[1]
        
end
