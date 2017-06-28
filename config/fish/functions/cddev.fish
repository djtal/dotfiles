function cddev --description 'allow to quickly jump to project by their name'
  # dir=$(find ~/ciblo/projets -type d -mindepth 1 -maxdepth 2 -name "$1" | head -n 1)
  # dir=$(find ~/Developement/Projects -mindepth 1 -maxdepth 2 -name "$1" -type d | head -n 1)
  set dir (find ~/Developement -mindepth 1 -maxdepth 2 -name $argv[1] -type d | head -n 1)

  if [ "$dir" ];
    cd "$dir"
  else
    echo "Aucun projet '($argv[1])' trouvé..." >&2
    return 1
  end
end
