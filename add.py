# -*- coding: utf-8 -*- 
'''
解答
問1の解：9007199254740993 > 9007199254740992
問2の解：0E-10 = 0.0
問3の解：1.00000000000000000000000000000 > 0E-28

実行環境
プラットフォーム：Ubuntu 14.04 for Amd64
処理系：Python 3.4.0
CPU：Core i7-4700MQ
メモリ：8GB
計算時間（秒）：1

環境構築方法
1. sudo apt-get update
2. sudo apt-get install python3

実行方法
1. ファイル名を「add.py」とする。
2. python3 add.py q1.csv
3. python3 add.py q2.csv
4. python3 add.py q3.csv
'''

import csv
import sys
from decimal import *

getcontext().prec = 63
with open(sys.argv[1], newline='') as f:
    a = Decimal(0)
    b = Decimal(0)
    reader = csv.reader(f)
    for row in reader:
        a += Decimal(row[0])
        b += Decimal(row[1])
    print(a, "<" if a < b else (">" if a > b else "="), b);
