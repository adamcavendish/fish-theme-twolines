function fish_right_prompt --description "Write out the right prompt"
	set -l last_status $status

  if not test $last_status -eq 0
    # if error
    set_color $fish_color_error
    echo -n $last_status' ↵'
  else
    # User
    set_color $fish_color_user
    echo -n (whoami)
    set_color normal

    echo -n '@'

    # Host
    set_color $fish_color_host
    echo -n (hostname -s)
    set_color normal
  end
end

