function vim
  if command -sq nvim
    nvim $argv
  else
    command vim $argv
  end
end
