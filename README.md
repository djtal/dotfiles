# DjT@l dotfile

## Using this repo

This repos contain configuration and installation script to easly setup/maintain config accross multiple computer in a easy way

Basicaly all files are symlink to ~/. If you want to customize some of them
simly compy them and a a cutline to delimit the part touched by the reference
file.

Configuration and scripts are compatible with Ubuntu 12.04 and Os X.

## Usage

Clone this repo where you want and run the install script
Get the submodule 

```bash
$ git submodule init
$ git submodule update
```

```bash
$ ./install.sh
```

It also use [homebrew](http://brew.sh/) to install additionnal sofwtare.
To update your installed software

```bash
$ cd dotfiles
$ brew bundle
```

## What you'll find here

### Some great sofware

* bash (4.X since osx ship with 3.X)
* git 
* neovim
* tmux
* ack
* [ag](http://geoff.greer.fm/ag/)
* [shellcheck](https://github.com/koalaman/shellcheck)

### Some small utilities function

* **cddev** :

Some functions are based on my filesytem organisation. feel free to change the
to suit your need. Theses are "cdproj" and "cddev"

## Keyboard Setup

It use [Karabiner](https://pqrs.org/osx/karabiner/) to change mapping of your keys and
[Seil](https://pqrs.org/osx/karabiner/seil.html.en) to allow to remap your caps lock key too

**Remap Capslock to Ctr when hold or escape when touch**

* Map  CapsLock to F19 (code 80) in Seil
* In Karabiner and search for "F19" and ativate. Check the box next to “CapsLock to Escape and Control”.

**Remap Control+W to delete previous word**

In Karabiner and search for “Control+W”. Check the box next to “[ex] Control+W to Option+Delete” under “Emacs Mode”.

**Remap ² to Escap**

For PC Keyboard.

In Karabiner and search for "Map ² to escape" and activate.

## Credits

Inspiration taken from

* [Mathias Bynens dot files](https://github.com/mathiasbynens/dotfiles)
* [dotfiles.github.com](http://dotfiles.github.com/)
* [@climagic](https://twitter.com/climagic)
* [shell pro tip](https://coderwall.com/p/t/bash) from codewall

My coworkers for all the tips and tricks
And many others

