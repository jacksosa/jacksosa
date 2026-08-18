# dotfiles

My Linux Mint configuration files, kept under version control for a reproducible,
git-synced setup.

## Contents

| File | Purpose |
|---|---|
| `.zshrc` | oh-my-zsh config — plugins, aliases, sdkman/nvm init |
| `.zshenv` | base `$PATH` for every zsh invocation |
| `.zprofile` | login-shell config |
| `.profile` | login profile (PATH, GTK menu) |
| `.gitconfig` | git identity + SSH commit signing |
| `.p10k.zsh` | powerlevel10k prompt config |
| `.bashrc` | bash fallback config |

## Scripts

Shell scripts — including `maintenance.sh` — live in a separate repo: **`Scripts`**
(`github.com/jacksosa/Scripts`). Kept separate so each script only needs updating
in one place.

## Install

Symlink each file into `$HOME`:

```sh
cd "$(dirname "$0")"
for f in .zshrc .zshenv .zprofile .profile .gitconfig .p10k.zsh .bashrc; do
  ln -sf "$PWD/$f" "$HOME/$f"
done
```
