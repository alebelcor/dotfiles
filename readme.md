# dotfiles

> My dotfiles

## Pre-setup

* `gas-mask/work.hst`: Extended hosts file for work-related hostname mappings. If file does not exist, an empty file will be created
* `git/gitconfig.local.symlink`: Extended Git configuration for private, or work-related stuff
* `git/gitignore.local.symlink`: Extended ignore list for Git, referenced in `gitconfig.local.symlink`
* `nextdns/dnscrypt-proxy.toml`: Extended DNSCrypt configuration for NextDNS<sup>*</sup>. If file does not exist, one will be created based on your input
* `tmux/tmux.conf.local.symlink`: Extended Tmux configuration for private, or work-related stuff

<sup>*</sup> – Found on the ["Setup" page](https://my.nextdns.io/) > Setup Guide > Routers > DNSCrypt

## Installation

```sh
mkdir -p ~/projects/dotfiles
cd ~/projects/dotfiles
git clone https://github.com/alebelcor/dotfiles.git .
source scripts/bootstrap
```

### Git-free install

```sh
mkdir -p ~/projects/dotfiles
cd ~/projects/dotfiles
curl --location https://github.com/alebelcor/dotfiles/tarball/master | tar -xz --strip-components 1 --exclude={.editorconfig,.gitattributes,.gitignore,license,readme.md}
source scripts/bootstrap
```

## Usage

Everything is built around "topics".
A "topic" is a folder associated to a specific subject (e.g. `node` for [Node.js](http://nodejs.org/)).
A "topic" will have setup and configuration relevant to the subject like so:

* `topic/path.zsh`: Any file named `path.zsh` is loaded first and is expected to setup `$PATH`
* `topic/*.zsh`: Any files ending in `.zsh` get loaded into your environment
* `topic/completion.zsh`: Any file named `completion.zsh` is loaded last and is expected to set up autocomplete
* `topic/install.sh`: Any file named `install.sh` is executed when you run `scripts/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`
* `topic/*.symlink`: Any file ending in `.symlink` gets symlinked into your `$HOME` when you run `script/bootstrap`

There are other files/folders not related to a specific "topic":

* `bin/`: Anything here will get added to the `$PATH`
* `scripts/`: Contains scripts relevant to the dotfiles installation
* `Brewfile`: A list of command-line utils, apps, and others, that will be installed via [Homebrew](https://brew.sh/), [Homebrew-Cask](https://caskroom.github.io/), and [`mas-cli`](https://github.com/mas-cli/mas)

## Inspired by

* [holman does dotfiles](https://github.com/holman/dotfiles)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

## License

MIT © Alejandro Beltrán
