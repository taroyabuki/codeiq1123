/*
解答
問1の解：9007199254740993.000000000000000000000000000000 > 9007199254740992.000000000000000000000000000000
問2の解：0.000000000000000000000000000000 = 0.000000000000000000000000000000
問3の解：1.000000000000000000000000000000 > 0.000000000000000000000000000000

実行環境
プラットフォーム：Ubuntu 14.04 for Amd64
処理系：MySQL 5.5.38
CPU：Core i7-4700MQ
メモリ：8GB
計算時間（秒）：1

環境構築方法
1. sudo apt-get update
2. sudo apt-get install mysql-server mysql-client

実行方法
（MySQLの管理者パスワードが「pass」の場合）
1. ファイル名を「add.sql」とする。
2. mysql -uroot -ppass --local-infile < add.sql
*/

create database test;
use test;

create table foo (
  a decimal(65,30),
  b decimal(65,30)
);

load data local infile "q1.csv" into table foo fields terminated by ',';
select concat(
    sum(a),
    if (sum(a)<sum(b),' < ',if(sum(a)>sum(b),' > ',' = ')),
    sum(b)
  ) as result
  from foo;

truncate foo;
load data local infile "q2.csv" into table foo fields terminated by ',';
select concat(
    sum(a),
    if (sum(a)<sum(b),' < ',if(sum(a)>sum(b),' > ',' = ')),
    sum(b)
  ) as result
  from foo;

truncate foo;
load data local infile "q3.csv" into table foo fields terminated by ',';
select concat(
    sum(a),
    if (sum(a)<sum(b),' < ',if(sum(a)>sum(b),' > ',' = ')),
    sum(b)
  ) as result
  from foo;
