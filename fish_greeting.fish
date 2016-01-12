function fish_greeting
  set -l load_average (uptime | awk -F ',  ' '{print $4}')
  set -l mem_use (free | awk '\
/Mem/{printf("used: %.2f%"), $3/$2*100}\
/buffers\/cache/{printf(", buf: %.2f%"), $4/($3+$4)*100}\
/Swap/{printf(", swap: %.2f%"), $3/$2*100}')

  set_color grey
  echo -n $load_average
  echo -n "; mem use: {"$mem_use"}"
  echo
  set_color normal
end
