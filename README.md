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

* **tm_proj** :

Easy open tmux session with the given name or switch to it if already exist.
It's the next evolution of `tm`
Now it manage a layout file to describe how to split you pane(s). The layout file can be present on the root of you project. If not it will check at `~/`

layout file is simple bash file which is sourced when opening.
Sample layout file

```bash

split-window -v -p 35 -c "#{pane_current_path}"
new-window -n "my-pane-name" -c "#{pane_current_path}"

```

* **gifenc** : 

Create short gif from a video. Usefull to send terminal based video inside PR or
via slack.
It need `ffmpeg` to work and is based on [High quality GIF with FFmpeg](http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html for more details)

### Apps

These are specfic apps I use. They're not always free or open source but I find them usefull in my day to day job.

* [Alfred](https://www.alfredapp.com/)
* [Rectangle](https://rectangleapp.com/)
* [Karabiner Elements](https://karabiner-elements.pqrs.org/)
* [Postgres Aapp](https://postgresapp.com/)
* [Postico 2](https://eggerapps.at/postico2/)
* [MacDown](https://macdown.uranusjr.com/)
* [tad](https://www.tadviewer.com/)
* [Choosy](https://choosy.app/)
* [CleanShot](https://cleanshot.com/)


### Additionals cli tools

Thoses tools are not automaticaly installed with a `brew bundle`command.
You need to manualy install them if you need

**[grv](https://github.com/rgburke/grv)**

Git cli GUI. Simillar to `tig`

**[mdt](https://github.com/monochromegane/mdt)**

Easy format string to markdown table

**[yaml](https://github.com/mikefarah/yaml )**

[jq]() for yaml files

**[chroma](https://github.com/alecthomas/chroma)**

read any files wilth syntax higlight on you terminal

**[go-jira](https://github.com/go-jira/jira)**

cli tool to read issue from jira and to manage lot of jira stuff too.
Need to copy the `jira.d` directory to `~/.jira.d` and set appriate keys coresponding to your jira account


**[shfmt](https://github.com/mvdan/sh)**

Bash formater

**[tyke](http://tyke.io/)**

Add quick txt not to you menubar for later use.
A fork exist : https://github.com/buddax2/tmpNote


**[ptags](https://github.com/dalance/ptags)**

A parallel universal-ctags wrapper for git repository
Quickly index tags on any git repos
Used from vim also
Install from `cargo` `cargo install ptags`

**[Atuin](https://github.com/ellie/atuin)**

Allow recording shell history inside a sqlite db
The you can query it as you want


**[switchaudio-osx](https://github.com/deweller/switchaudio-osx)** : 

Allow changing audio output device from cli
The we use [Alfred](https://www.alfredapp.com/) to change source via keyboard easily

**[dsq](https://github.com/multiprocessio/dsq)**

Easily process any datasource


## Keyboard Setup

It use [Karabiner](https://karabiner-elements.pqrs.org/) to add some custom mappings

**Remap Capslock to Ctr when hold or escape when touch**


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
* [ahmetb](https://github.com/ahmetb/dotfiles)

My coworkers for all the tips and tricks
And many others


