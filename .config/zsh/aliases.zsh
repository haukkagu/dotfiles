# Abbreviations
alias \
    ..="cd .." \
    ..="cd .." \
    ...="cd ../.." \
    ....="cd ../../.." \
    .....="cd ../../../.." \
    e="$EDITOR" \
    o="xdg-open" \
    h="history" \
    ls='eza' \
    la='eza -a' \
    ll='eza -l' \
    l.='eza -d .*' \
    lS='eza -al --sort=size' \
    lt='eza -al --sort=modified'

# Add common arguments to commands by default
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkdir="mkdir -pv" \
    grep="grep --color=auto" \
    egrep="grep -E --color=auto" \
    fgrep="grep -F --color=auto"

# Git
function git_current_branch() {
    git rev-parse --abbrev-ref HEAD
}

function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

alias \
    g='git' \
    ginit='git init' \
    gcl='git clone --recurse-submodules' \
    gst='git status' \
    ga='git add' \
    gaa='git add --all' \
    gc='git commit -v' \
    gc!='git commit -v --amend' \
    gl='git pull' \
    gp='git push' \
    gpf='git push --force-with-lease' \
    gpsup='git push --set-upstream origin $(git_current_branch)' \
    gb='git branch' \
    gco='git checkout' \
    gcm='git checkout $(git_main_branch)' \
    gcb='git checkout -b' \
    glg='git log --stat' \
    gd='git diff' \
    gdca='git diff --cached' \
    grb='git rebase' \
    grbm='git rebase $(git_main_branch)' \
    grba='git rebase --abort' \
    grbc='git rebase --continue' \
    gm='git merge' \
    gma='git merge --abort' \
    gsta='git stash' \
    gstaa='git merge --apply' \
    gclean='git clean -id'
