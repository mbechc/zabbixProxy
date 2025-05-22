#!/bin/sh

CONFIG_SRC="/iox_data/package_config.ini"
inside=0
outfile=""

# Extract embedded config files
while IFS= read -r line; do
  case "$line" in
    @@@FILE:*)
      outfile=$(echo "$line" | cut -d':' -f2-)
      mkdir -p "$(dirname "$outfile")"
      exec 3> "$outfile"
      inside=1
      ;;
    @@@END)
      if [ "$inside" -eq 1 ]; then
        exec 3>&-
        echo "Wrote: $outfile"
        inside=0
        outfile=""
      fi
      ;;
    *)
      [ "$inside" -eq 1 ] && echo "$line" >&3
      ;;
  esac
done < "$CONFIG_SRC"

# Start Zabbix proxy in foreground
exec /usr/sbin/zabbix_proxy -f

