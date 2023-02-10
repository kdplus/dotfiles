set fish_greeting ""

set -gx TERM xterm-256color

# windows home dir
set -gx WINHOME /mnt/c/Users/yuxiv
alias cdd 'cd $WINHOME'

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias vim lvim

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# nvim && lvim
set -gx EDITOR lvim
set -gx PATH /usr/local/nvim-linux64/bin $PATH

# cargo && rustc
set -gx PATH $HOME/.cargo/bin $PATH

# exa
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# startship
starship init fish | source
cd $HOME
