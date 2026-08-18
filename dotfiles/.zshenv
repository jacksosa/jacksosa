# ~/.zshenv — sourced for EVERY zsh invocation (login, interactive, scripts,
# and IDE/agent-integrated terminals). This is the canonical place to establish
# a reliable base PATH so core tools are always available even when the shell is
# launched with an empty or minimal environment. Interactive tool managers in
# ~/.zshrc (sdkman, nvm) then layer on top of this base.

# Keep PATH entries unique and tie the `path` array to PATH.
typeset -U path PATH

# Guarantee the standard system directories (and personal bins) are present.
# Existing entries ($path) are preserved; duplicates are removed automatically.
path=(
  $HOME/.local/bin
  $HOME/bin
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
  /sbin
  /bin
  $path
)

export PATH

