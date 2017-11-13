#!/bin/sh

# taken from https://github.com/thoughtbot/dotfiles/blob/master/install.sh

cutstring="DO NOT EDIT BELOW THIS LINE"

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      cutline=`grep -n -m1 "$cutstring" "$target" | sed "s/:.*//"`
      if [ -n "$cutline" ]; then
        cutline=$((cutline-1))
        echo "Updating $target"
        head -n $cutline "$target" > update_tmp
        startline=`sed '1!G;h;$!d' "$name" | grep -n -m1 "$cutstring" | sed "s/:.*//"`
        if [ -n "$startline" ]; then
          tail -n $startline "$name" >> update_tmp
        else
          cat "$name" >> update_tmp
        fi
        mv update_tmp "$target"
      else
        echo "WARNING: $target exists but is not a symlink."
      fi
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'README.md' ] && [ "$name" != "misc" ] && [ "$name" != "init" ]; then
      echo "Creating $target"
      if [ -n "$(grep "$cutstring" "$name")" ]; then
        cp "$PWD/$name" "$target"
      else
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Copy some preferences too that shoud be stored in init folder
# All file in init are specific so each deserve it's way to be installed
cp -r init/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null
