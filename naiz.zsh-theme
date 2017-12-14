autoload -Uz vcs_info
autoload -U colors && colors
setopt promptsubst

zstyle ':vcs_info:git*' formats '%b (%a)'

precmd () {
  vcs_info

  STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
  git_branch=""

  if [[ -n $vcs_info_msg_0_ ]]; then
    if [[ -n $STATUS ]]; then
      git_branch='%F{yellow}$vcs_info_msg_0_ '
    else
      git_branch='%F{blue}$vcs_info_msg_0_ '
    fi
  fi

  PROMPT='
 %c '${git_branch}
}

