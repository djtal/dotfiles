# DjT@l dotfile

## Using this repo

Contain configurations for mostly CLI tools and some osx specific options

Configurations and scripts are compatible with Ubuntu 12.04 and OS X if possible

## How it work

All files and directories are symlinked to `~/`. 

You can choose to copy some file to make custom change inside if you don't want to sync change to upstream repo.
Add cutline to each file you want to copy insteand of symlink 
This line will delimit the part iof the file that will be sync from the upsteam from the part that will  be kept only locally.


## Usage

Clone this repo where you want and run the install script
Get the submodules

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

### Brew installed tools

* bash (4.X since osx ship with 3.X)
* git 
* neovim
* tmux

Check `Brewfile` for more

### Some small utilities functions

Some functions are based on my filesytem organisation. feel free to change the
to suit your need. Theses are "cdproj" and "cddev"

* **cddev** :

Quickly jump to any first level directory located in a base directory.
Customize you base directory by setting the `CD_DEV_PATH` environement variable. Default to `~/`


* **tm** :

Easy open tmux session with the given name or switch to it if already exist



### Additionals tools

Thoses tools are not automaticaly installed with a `brew bundle`command.
You need to manualy install them if you need

** [grv](https://github.com/rgburke/grv)**

Git cli GUI. Simillar to `tig`

**[mdt](https://github.com/monochromegane/mdt)**

Easy format string to markdown table

**[yaml](https://github.com/mikefarah/yaml )**

[jq]() for yaml files

**[chroma](https://github.com/alecthomas/chroma)**

read any files wilth syntax higlight on you terminal

**[go-jira](https://github.com/Netflix-Skunkworks/go-jira)**

cli tool to read issue from jira and to manage lot of jira stuff too.

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


