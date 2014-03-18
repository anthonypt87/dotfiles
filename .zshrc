# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias i="ipython tools/interactive.py"
alias cbr="git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'"
alias l="ls -altr"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export PATH=/nail/usr/bin:/nail/sys/bin:/nail/workflow:/nail/scripts:/nail/home/anthony/python-lib:/nail/home/anthony/.local/bin:/nail/home/anthony/bin/:/nail/home/anthony/pypa-virtualenv-d4e6e6b/build/lib.linux-x86_64-2.6/:/nail/workflow/:/nail/home/anthony/pg/loc/aws/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/nail/iclassify/bin

bindkey -v

export PYTHONPATH=$PYTHONPATH:~/python-lib

is_sandbox()
{
    echo $YELP_IN_SANDBOX
}
gitlist()
{
    for k in `git branch|sed s/^..//`;do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k"`\\t"$k";done|sort
}

# COMPLETION SETTINGS
# add custom completion scripts
fpath=(~/.completions $fpath) 

# compsys initialization
autoload -U compinit
compinit
bindkey '^R' history-incremental-search-backward
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word 
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" kill-line 

function find_all_ssh_agent_sockets() {
    find /tmp -type s -name agent.\* 2> /dev/null | grep '/tmp/ssh-.*/agent.*'
}

function set_ssh_agent_socket() {
    export SSH_AUTH_SOCK=$(find_all_ssh_agent_sockets | tail -n 1 | awk -F: '{print $1}')
}

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

alias ipy="python -c 'import IPython; IPython.frontend.terminal.ipapp.launch_new_instance()'"
