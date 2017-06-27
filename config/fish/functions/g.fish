function g --wraps git --description 'smart shortcut to git & git status'
  if count $argv > 0
    git $argv
  else
    git status --short --branch
  end
end
