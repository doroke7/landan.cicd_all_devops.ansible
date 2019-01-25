mysqlimport -uroot test /tmp/users.csv --fields-terminated-by="," --lines-terminated-by="\r\n"

mysqldbcompare --server1=root:mysql_pass_cli@127.0.0.1:3306 --server2=root:mysql_pass_router@10.0.0.22:3306 landan:landan

mysqldiff --server1=root:mysql_pass_cli@127.0.0.1:3306 --server2=root:mysql_pass_router@10.0.0.22:3306 landan.users:landan.users

mysqldump -uroot -T /tmp/ landan users --fields-terminated-by="," --where

mysqlbinlog  mysql-bin.000007