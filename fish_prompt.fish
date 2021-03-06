function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  # PWD
  set_color $fish_color_cwd
  echo -n (pwd)
  set_color normal

  __terlar_git_prompt
  __fish_hg_prompt


  if not test $last_status -eq 0
    # if error
    set_color $fish_color_error
    echo -n ' '$last_status' ↵'

    echo

    echo -n '➤ '
  else
    # User & Hostname
    set_color $fish_color_user
    echo -n ' '(whoami)
    set_color $fish_color_host
    echo -n '@'(hostname -s)

    echo

    set_color purple
    echo -n '➤ '
  end
  set_color normal

  echo
end
