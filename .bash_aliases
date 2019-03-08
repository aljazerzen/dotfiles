alias nr="npm run"
alias gs="git status"
alias gg="git log --branches --remotes --tags --graph --decorate --oneline"
alias gp='echo "Pushing:"; git log $(git rev-parse --abbrev-ref HEAD)...$(git rev-parse --symbolic-full-name --abbrev-ref @{u}) --oneline; echo ""; git push'

alias vim="echo 'please use micro'"

