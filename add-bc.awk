#解答
#問1の解：9007199254740993 > 9007199254740992
#問2の解：0 = 0
#問3の解：1.0000000000000000000000000 > 0
#
#実行環境
#プラットフォーム：Ubuntu 14.04 for Amd64
#処理系：GNU Awk 4.0.1, bc 1.06.95
#CPU：Core i7-4700MQ
#メモリ：8GB
#計算時間（秒）：1
#
#環境構築方法
#1. sudo apt-get update
#2. sudo apt-get install gawk
#
#実行方法
#1. ファイル名を「add-bc.awk」とする。
#2. gawk -f add-bc.awk q1.csv | bc
#3. gawk -f add-bc.awk q2.csv | bc
#4. gawk -f add-bc.awk q3.csv | bc

BEGIN {
  FS = ",";
  a = "";
  b = "";
}
{
  gsub("\r", "");
  gsub("e\\+", "*10^");
  gsub("e", "*10^");
  if (NR == 1) {
    a = $1
    b = $2
  } else {
    a = a "+" $1;
    b = b "+" $2;
  }
}
END {
  print "scale = 25"
  print "a=(" a ")";
  print "b=(" b ")";
  print "print a"
  print "if (a<b) print \" < \" else if (a>b) print \" > \" else print \" = \""
  print "print b,\"\\n\""
}
