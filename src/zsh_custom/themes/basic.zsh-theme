# https://gist.github.com/Samyak2/6676c608371e915e3c066dbbdcc25622
function conda_info {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]
    then
        echo "${CONDA_DEFAULT_ENV} "
    fi
}
local conda='$(conda_info)'

# Based on "cypher" theme
PROMPT="${conda}%{${fg_bold[red]}%}:: %{${fg[green]}%}%3~ %{${fg[blue]}%}»%{${reset_color}%} "
RPS1="%(?..%{${fg_bold[red]}%}%{${fg[red]}%}%? ↵%f)%{${reset_color}%}"
