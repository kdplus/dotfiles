set fish_greeting ""

set -gx TERM xterm-256color

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

# get external IP / internet speed
alias myip="curl https://ipinfo.io/json" # or /ip for plain-text ip
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# nvim && lvim
set -gx EDITOR lvim

# cargo && rustc
set -gx PATH $HOME/.cargo/bin $PATH

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

switch (uname -r)
  case '*WSL2'
    source (dirname (status --current-filename))/config-wsl2.fish
end
  
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# startship
starship init fish | source

# exa
if type -q exa
  alias ll "exa -l -g --icons"
  alias llt "ll -snew"
  alias lla "ll -a"
  alias llat "ll -a -snew"
  abbr --add llag ll -a --git
end

# conda env
abbr --add ca conda activate 
abbr --add cda conda deactivate 

