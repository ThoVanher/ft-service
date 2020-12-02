openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup 
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart

mysql --user=root << EOF
  CREATE DATABASE wordpress;
  CREATE USER 'wp_user'@'%' IDENTIFIED BY 'password';
  GRANT ALL ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
  CREATE USER 'thvanher'@'%' IDENTIFIED BY 'vanvan1990!';
  GRANT ALL ON *.* TO 'thvanher'@'%' IDENTIFIED BY 'vanvan1990!' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
EOF

mysql --user=root wordpress < /tmp/wordpress.sql

telegraf

tail -F /dev/null
