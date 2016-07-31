function fish_greeting
  set -l mem_use_awk '
    /^MemTotal:/{memtotal=$2}
    /^MemFree:/{memfree=$2}
    /^Buffers:/{buffer=$2}
    /^Cached:/{cached=$2}
    /^SwapTotal:/{swaptotal=$2}
    /^SwapFree:/{swapfree=$2}
    {
      memuse_pct=(memtotal-memfree)/memtotal*100;
      buffer_pct=buffer/memtotal*100;
      cached_pct=cached/memtotal*100;
      swapuse_pct=(swaptotal == 0) ? 0 : (swaptotal-swapfree)/swaptotal*100;
    }
    END {
      printf("used %.2f%%, buffers %.2f%%, cached %.2f%%, swap %.2f%%"), memuse_pct, buffer_pct, cached_pct, swapuse_pct
    }'
  set -l load_average (uptime | awk -F ",  " '{print $3}')
  set -l mem_use (cat /proc/meminfo | awk "$mem_use_awk")

  set_color grey
  echo $load_average
  echo "mem: "$mem_use
  set_color normal
end
