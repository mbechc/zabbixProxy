#!/bin/sh

INPUT_FILE="/iox_data/package_config.ini"
inside=0
outfile=""

while IFS= read -r line; do
  case "$line" in
    @@@FILE:*)
      outfile=$(echo "$line" | cut -d':' -f2-)
      mkdir -p "$(dirname "$outfile")"  # ✅ ensures /etc/zabbix exists
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
done < "$INPUT_FILE"

# Start Zabbix proxy
exec su-exec zabbix /opt/zabbix/sbin/zabbix_proxy -f
