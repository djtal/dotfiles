# DjT@l dotfile

## Using this repo

simply symlink file in your home

## Customizing sensible data

Simply add a ~/.extra file with your data

```bash
GIT_AUTHOR_NAME="You Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="your-email"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

## Notable things

extract function to extract all kind of file with search wich command tu use

Usage :
```bash
$ extract file.zip
```

## Credits

Inspiration taken from

* [Mathias Bynens dot files](https://github.com/mathiasbynens/dotfiles)
* [dotfiles.github.com](http://dotfiles.github.com/)
* [@climagic](https://twitter.com/climagic)
* [shell pro tip](https://coderwall.com/p/t/bash) from codewall

My coworkers for all the tips and tricks
And many others
