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

# Ensure database path exists and is writable
mkdir -p /var/lib/zabbix
chown -R zabbix:zabbix /var/lib/zabbix

while true; do
  echo "[INFO] Starting Zabbix Proxy as 'zabbix'..."
  su-exec zabbix /opt/zabbix/sbin/zabbix_proxy -f -c /etc/zabbix/zabbix_proxy.conf
  echo "[WARN] zabbix_proxy exited at $(date). Restarting in 5s..."
  sleep 5
done
