# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

theme="cloud"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

if [[ $- == *i* ]]; then
    # Commands to run in interactive sessions can go here
fi

export LS_COLORS="di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"
if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls --color=auto'
else
  alias ls='gls --color=auto'
fi

if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    BREW_BIN="/opt/homebrew/bin"
else
    # Linux
    BREW_BIN="/home/linuxbrew/.linuxbrew/bin"
fi

# Usar la variable BREW_BIN donde se necesite
eval "$($BREW_BIN/brew shellenv)"

source $(dirname $BREW_BIN)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(dirname $BREW_BIN)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(dirname $BREW_BIN)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(dirname $BREW_BIN)/share/powerlevel10k/powerlevel10k.zsh-theme

export PROJECT_PATHS="/home/rhood/Work"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"

#WM_VAR="/$TMUX"
# change with ZELLIJ
#WM_CMD="tmux"
# change with zellij

function start_if_needed() {
    if [[ $- == *i* ]] && [[ -z "${WM_VAR#/}" ]] && [[ -t 1 ]]; then
        exec $WM_CMD
    fi
}

# alias
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

#plugins
plugins=(
  command-not-found
  git
  pj
)

source $ZSH/oh-my-zsh.sh

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings para borrar palabras con Ctrl+Backspace
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' backward-kill-word
bindkey '^[[127;5u' backward-kill-word

start_if_needed
eval "$(zoxide init zsh)"

# Función para crear sesiones de tmux con z
# Uso: tz nombre_proyecto
function tz() {
    if [ -z "$1" ]; then
        echo "Uso: tz <nombre_proyecto>"
        return 1
    fi

    local session_name="$1"

    # Obtener el directorio del proyecto usando zoxide query
    local project_dir="$(zoxide query "$session_name" 2>/dev/null)"

    if [ -z "$project_dir" ]; then
        echo "Error: No se encontró el proyecto '$session_name' en zoxide"
        return 1
    fi

    # Verificar si ya estamos dentro de tmux
    if [ -n "$TMUX" ]; then
        # Si estamos dentro de tmux, verificar si la sesión existe
        if tmux has-session -t "$session_name" 2>/dev/null; then
            # Cambiar a la sesión existente
            tmux switch-client -t "$session_name"
        else
            # Crear una nueva sesión en el directorio del proyecto (desconectada)
            tmux new-session -d -s "$session_name" -c "$project_dir"
            # Cambiar a la nueva sesión
            tmux switch-client -t "$session_name"
        fi
    else
        # Si estamos fuera de tmux
        if tmux has-session -t "$session_name" 2>/dev/null; then
            # Adjuntarse a la sesión existente
            tmux attach-session -t "$session_name"
        else
            # Crear y adjuntarse a una nueva sesión en el directorio del proyecto
            tmux new-session -s "$session_name" -c "$project_dir"
        fi
    fi
}
