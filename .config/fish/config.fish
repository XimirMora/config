
function fish_prompt
	set wd (pwd | sed 's/\/home\/gilo/~/')
	set len_wd (expr length + $wd)
	if math "$len_wd > 30" > /dev/null
		set -l start_wd (expr substr + $wd 1 8)
		set -l end_wd (expr substr + $wd (math $len_wd - 8) $len_wd)
		set wd $start_wd...$end_wd
	end
	echo -ne "\033[1;33m$wd \033[1;36m╍ \033[0m"
end

# ALIASES {{{

alias vi=vim


# ALIASES }}}
