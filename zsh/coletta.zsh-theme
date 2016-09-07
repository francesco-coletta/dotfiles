if [ "$(whoami)" = "root" ];
	then CARETCOLOR="red";
	else CARETCOLOR="yellow"; 
fi

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo "±>" && return
    hg root >/dev/null 2>/dev/null && echo "☿>" && return
    echo '>'
}


function parse_hg_dirty {
  if [[ -n $(hg status -mard . 2> /dev/null) ]]; then
    echo "$ZSH_THEME_HG_PROMPT_DIRTY"
  fi
}

resetColor="%{$reset_color%}"
defaultColor="${resetColor}%{$fg[white]%}"

style_username="${resetColor}%{$fg[cyan]%}"
username="%n"

time="[%D{%d/%b %a} %*]"
style_time="${resetColor}%{$fg[white]%}"

hostname="%m"
style_hostname="${resetColor}%{$fg[yellow]%}"

pwd="%3~"
style_pwd="${resetColor}%{$fg[red]%}"

style_prompt="%{$fg_bold[$CARETCOLOR]%}${resetColor}"


# Build the prompt
PROMPT="╭─"
PROMPT+="${style_username}${username}" # Username
PROMPT+="${defaultColor}@" # @
PROMPT+="${style_hostname}${hostname}" # Host
PROMPT+=" "
PROMPT+="${style_time}${time}" # data + time
PROMPT+="${defaultColor}: " # :
PROMPT+="${style_pwd}${pwd}" # Working directory
PROMPT+=" "
#PROMPT+="$(git_prompt_info)" # Git details
#PROMPT+="$(hg_prompt_info)" # HG details
PROMPT+="" # Newline
#PROMPT+="${style_prompt}$(prompt_char)"
PROMPT+="${style_prompt}>"
PROMPT+="
╰─%B>%b "


RPROMPT=""
RPROMPT+="$(git_prompt_info)" # Git details
RPROMPT+="$(hg_prompt_info)" # HG details

#RPROMPT="$(vcs_super_info)"


ZSH_VCS_PROMPT_ENABLE_CACHING='false'
ZSH_VCS_PROMPT_USING_PYTHON='false'

#---------- HG
ZSH_THEME_HG_PROMPT_PREFIX="HG:%{$fg[magenta]%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
zSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN=""

#---------- GIT
ZSH_THEME_GIT_PROMPT_PREFIX="GIT:%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""





