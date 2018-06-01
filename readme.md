# dotfiles

> My dotfiles

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
curl --location https://github.com/alebelcor/dotfiles/tarball/master | tar -xz --strip-components 1 --exclude={.editorconfig,.gitattributes,.gitignore,readme.md}
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
