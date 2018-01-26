# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:$HOME/bin:$PATH"


# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
#ZSH_THEME="agitnoster"



########### NERD 1 ##################
POWERLEVEL9K_MODE="nerdfont-complete"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time ram)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uF073}"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{black}$(print $'\uE0B5')%F{black}"
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

########## Classic ##################
#POWERLEVEL9K_MODE='awesome-fontconfig'
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time ram)
#POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uF073}"
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
#POWERLEVEL9K_SHORTEN_DELIMITER=".."
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
#POWERLEVEL9K_DIR_PATH_SEPARATOR="%F{black}$(print $'\uE0B1')%F{black}"
#POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fast-syntax-highlighting cargo archlinux rust copyfile git-extras)


# User configuration
export VISUAL="nano"
export SSH_KEY_PATH="~/.ssh/rsa_id"

# ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing) > /dev/null
fi

# Virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh

# FASD
eval "$(fasd --init auto)"

# zsh-cache
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# Arch
alias sorp="pacman -Qdt"
alias korp="sudo pacman -Rs \$(pacman -Qtdq)"
alias updt="yaourt -Syu --aur"

# Linux
alias netrestart="sudo systemctl restart NetworkManager.service"
alias clc="sudo rm -rf /var/cache $HOME/.cache"
alias edz="code $HOME/.zshrc"

# Password Store
alias pgu="git -C $HOME/.password-store pull"
alias pgp="git -C $HOME/.password-store push"

# Python
alias pipreset="sudo pip freeze | xargs sudo pip uninstall -y"

# Git
alias gu="git up"
alias gdt="git difftool && delori"

# Dev tools/shortcuts
alias delori="find . -name '*.orig' -exec rm {} +"
wuzu() {
    WUZU_HOME=$HOME/projects/wuzu
    for repo in $WUZU_HOME/*; do
        basename $repo:
        (cd "${repo}" && git up)
        echo
    done
}

#autoload -U promptinit; promptinit
#prompt pure
