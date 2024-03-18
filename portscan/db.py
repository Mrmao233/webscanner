"""
===============
@author:maverick0407
@time:2023/4/9
@email:1484333494@qq.com
@ide_version:PyCharm
===============
"""

from portscan.models import Port
import os
import django



ports = [
            {'port_number': 21, 'service': 'FTP', 'protocol': 'TCP'},
            {'port_number': 22, 'service': 'SSH', 'protocol': 'TCP'},
            {'port_number': 23, 'service': 'Telnet', 'protocol': 'TCP'},
            {'port_number': 25, 'service': 'SMTP', 'protocol': 'TCP'},
            {'port_number': 53, 'service': 'DNS', 'protocol': 'UDP/TCP'},
            {'port_number': 67, 'service': 'DHCP', 'protocol': 'UDP'},
            {'port_number': 68, 'service': 'DHCP', 'protocol': 'UDP'},
            {'port_number': 80, 'service': 'HTTP', 'protocol': 'TCP'},
            {'port_number': 110, 'service': 'POP3', 'protocol': 'TCP'},
            {'port_number': 119, 'service': 'NNTP', 'protocol': 'TCP'},
            {'port_number': 123, 'service': 'NTP', 'protocol': 'UDP'},
            {'port_number': 137, 'service': 'NetBIOS', 'protocol': 'UDP'},
            {'port_number': 138, 'service': 'NetBIOS', 'protocol': 'UDP'},
            {'port_number': 139, 'service': 'NetBIOS', 'protocol': 'TCP'},
            {'port_number': 143, 'service': 'IMAP', 'protocol': 'TCP'},
            {'port_number': 161, 'service': 'SNMP', 'protocol': 'UDP'},
            {'port_number': 162, 'service': 'SNMP', 'protocol': 'UDP'},
            {'port_number': 389, 'service': 'LDAP', 'protocol': 'TCP/UDP'},
            {'port_number': 443, 'service': 'HTTPS', 'protocol': 'TCP'},
            {'port_number': 445, 'service': 'SMB/CIFS', 'protocol': 'TCP/UDP'},
            {'port_number': 465, 'service': 'SMTPS', 'protocol': 'TCP'},
            {'port_number': 514, 'service': 'Syslog', 'protocol': 'UDP'},
            {'port_number': 515, 'service': 'Line Printer Daemon', 'protocol': 'TCP/UDP'},
            {'port_number': 543, 'service': 'LDAP over SSL', 'protocol': 'TCP'},
            {'port_number': 544, 'service': 'Kerberos', 'protocol': 'TCP/UDP'},
            {'port_number': 548, 'service': 'AFP', 'protocol': 'TCP'},
            {'port_number': 587, 'service': 'SMTP Submission', 'protocol': 'TCP'},
            {'port_number': 636, 'service': 'LDAP over SSL', 'protocol': 'TCP'},
            {'port_number': 873, 'service': 'rsync', 'protocol': 'TCP/UDP'},
            {'port_number': 902, 'service': 'VMware Server Console', 'protocol': 'TCP/UDP'},
            {'port_number': 989, 'service': 'sftp', 'protocol': 'tcp'},
            {'port_number': 990, 'service': 'ftps', 'protocol': 'tcp'},
            {'port_number': 993, 'service': 'imaps', 'protocol': 'tcp'},
            {'port_number': 995, 'service': 'pop3s', 'protocol': 'tcp'},
            {'port_number': 1080, 'service': 'socks', 'protocol': 'tcp/udp'},
            {'port_number': 1194, 'service': 'openvpn', 'protocol': 'udp'},
            {'port_number': 1433, 'service': 'ms-sql-s', 'protocol': 'tcp'},
            {'port_number': 1434, 'service': 'ms-sql-m', 'protocol': 'tcp/udp'},
            {'port_number': 1521, 'service': 'oracle', 'protocol': 'tcp'},
            {'port_number': 1723, 'service': 'pptp', 'protocol': 'tcp'},
            {'port_number': 2049, 'service': 'nfs', 'protocol': 'tcp/udp'},
            {'port_number': 2181, 'service': 'zookeeper', 'protocol': 'tcp'},
            {'port_number': 3306, 'service': 'mysql', 'protocol': 'tcp'},
            {'port_number': 3389, 'service': 'rdp', 'protocol': 'tcp'},
            {'port_number': 3690, 'service': 'svn', 'protocol': 'tcp'},
            {'port_number': 4369, 'service': 'erlang-port-mapper', 'protocol': 'tcp'},
            {'port_number': 5432, 'service': 'postgresql', 'protocol': 'tcp'},
            {'port_number': 5555, 'service': 'freeciv', 'protocol': 'tcp'},
            {'port_number': 5900, 'service': 'vnc', 'protocol': 'tcp'},
            {'port_number': 6000, 'service': 'x11', 'protocol': 'tcp'},
            {'port_number': 6379, 'service': 'redis', 'protocol': 'tcp'},
            {'port_number': 6667, 'service': 'irc', 'protocol': 'tcp'},
            {'port_number': 6697, 'service': 'ircs', 'protocol': 'tcp'},
            {'port_number': 8000, 'service': 'http-alt', 'protocol': 'tcp'},
            {'port_number': 8080, 'service': 'http-proxy', 'protocol': 'tcp'},
            {'port_number': 8443, 'service': 'https-alt', 'protocol': 'tcp'},
            {'port_number': 8888, 'service': 'http-alt', 'protocol': 'tcp'},
            {'port_number': 9000, 'service': 'cslistener', 'protocol': 'tcp'},
            {'port_number': 9090, 'service': 'websm', 'protocol': 'tcp'},
            {'port_number': 9200, 'service': 'elasticsearch', 'protocol': 'tcp'},
            {'port_number': 9418, 'service': 'git', 'protocol': 'tcp'},
            {'port_number': 9999, 'service': 'abyss', 'protocol': 'tcp'},
            {'port_number': 10000, 'service': 'snet-sensor-mgmt', 'protocol': 'tcp'},
            {'port_number': 11211, 'service': 'memcached', 'protocol': 'tcp'},
]

for port in ports:
    p = Port(port_number=port['port_number'], service=port['service'], protocol=port['protocol'])
    p.save()
