function v --description 'quick alias to vagrant '
  if count $argv > 0
    vagrant $argv
  else
    vagrant status
  end
end
