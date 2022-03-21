#!/bin/bash

curl -s https://pastebin.com/raw/Z1uHVN3G | sed 's/\r$//' > /etc/zabbix/scripts/wsrep_get.sh

echo "[client]" > /etc/zabbix/scripts/wsrep_config.cfg
echo "user = \"$(grep 'mysql_user' /var/lib/zabbix/percona/scripts/ss_get_mysql_stats.php.cnf | cut -d"'" -f2)\"" >> /etc/zabbix/scripts/wsrep_config.cfg
echo "password = \"$(grep 'mysql_pass' /var/lib/zabbix/percona/scripts/ss_get_mysql_stats.php.cnf | cut -d"'" -f2)\"" >> /etc/zabbix/scripts/wsrep_config.cfg

curl -s https://pastebin.com/raw/1fuRC3KV | sed 's/\r$//' > /etc/zabbix/zabbix_agentd.d/wsrep_get.conf

chown zabbix:zabbix /etc/zabbix/scripts/*
chmod 755 /etc/zabbix/scripts/wsrep_get.sh

systemctl restart zabbix-agent
