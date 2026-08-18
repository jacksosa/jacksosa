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
| `maintenance.sh` | weekly/monthly admin script (live at `~/Scripts/maintenance.sh`) |

## Install

Symlink each file into `$HOME`:

```sh
cd "$(dirname "$0")"
for f in .zshrc .zshenv .zprofile .profile .gitconfig .p10k.zsh .bashrc; do
  ln -sf "$PWD/$f" "$HOME/$f"
done
mkdir -p "$HOME/Scripts"
ln -sf "$PWD/maintenance.sh" "$HOME/Scripts/maintenance.sh"
```
