local current_dir='%{$fg_bold[red]%}[%{$reset_color%}%~% %{$fg_bold[red]%}]%{$reset_color%}'
local git_branch='$()%{$reset_color%}'


PROMPT="
%(?,%{$fg_bold[cyan]%} ┌─╼%{$fg_bold[cyan]%}[%{$fg_bold[blue]%}LUCKY%{$fg_bold[yellow]%}〄%{$fg_bold[green]%}SIMU%{$fg_bold[cyan]%}]%{$fg_bold[cyan]%}-%{$fg_bold[cyan]%}[%{$fg_bold[green]%}%(5~|%-1~/…/%2~|%4~)%{$fg_bold[cyan]%}]%{$reset_color%} ${git_branch}
%{$fg_bold[cyan]%} └────╼%{$fg_bold[yellow]%} ❯%{$fg_bold[blue]%}❯%{$fg_bold[cyan]%}❯%{$reset_color%} ,%{$fg_bold[cyan]%} ┌─╼%{$fg_bold[cyan]%}[%{$fg_bold[green]%}%(5~|%-1~/…/%2~|%4~)%{$fg_bold[cyan]%}]%{$reset_color%}
%{$fg_bold[cyan]%} └╼%{$fg_bold[cyan]%} ❯%{$fg_bold[blue]%}❯%{$fg_bold[cyan]%}❯%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
