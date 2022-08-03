# dotfiles

## Setup

Create a file located at `~/.config/dotfiles/values.yaml` and include
your custom settings.

```bash
$ cd $HOME && mkdir -p .config/dotfiles && vim .config/dotfiles/values.yaml
```

### Minimal example of `values.yaml` file

```bash
---
git_user_email: foo@bar.com
git_user_name: Foo Bar
```

## Usage

### Install

```bash
$ bash -c "$(curl -fsSl https://raw.githubusercontent.com/rbaumgardner93/dotfiles/main/bin/dotfiles)"

```

## Update

To update your environment run the dotfiles command in your shell:

```bash
$ dotfiles
```

- - -

This dotfile setup is heavily inspired by the ALT-F4-LLC dotfiles found [here](https://github.com/ALT-F4-LLC/dotfiles).
Check out their repo for more configuration options.
