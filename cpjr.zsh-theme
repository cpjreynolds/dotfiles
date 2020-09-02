local ret_status="%(?:%{$fg[green]%}@:%{$fg[red]%}@)"

PROMPT='${ret_status} %{$fg[cyan]%}%2~$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}:%{$fg[red]%}±%{$reset_color%}:"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}:%{$fg[green]%}±%{$reset_color%}:"