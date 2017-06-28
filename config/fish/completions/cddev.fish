function __cddev
  find ~/Developement -mindepth 1 -maxdepth 2 ! -name '.*' -name "$argv[1]*" -type d | xargs basename
end

complete -f -c cddev -a "(__cddev)"
