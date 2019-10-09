 netsh advfirewall firewall Add rule name="MYSQL_SHEYLA" dir=out protocol=TCP localport=3306 action=allow
 netsh advfirewall firewall Add rule name="MYSQL_SHEYLA" dir=in protocol=TCP localport=3306 action=allow

