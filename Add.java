/*
解答
問1の解：9007199254740993 > 9007199254740992
問2の解：0E-10 = 0.0
問3の解：1.00000000000000000000000000000 > 0E-28

実行環境
プラットフォーム：Ubuntu 14.04 for Amd64
処理系：Java 1.7.0_65
CPU：Core i7-4700MQ
メモリ：8GB
計算時間（秒）：1

環境構築方法
1. sudo apt-get update
2. sudo apt-get install openjdk-7-jdk

実行方法
1. ファイル名を「Add.java」とする。
2. javac Add.java
3. java Add q1.csv
4. java Add q2.csv
5. java Add q3.csv
*/

import java.math.*;
import java.io.*;
import java.nio.file.*;
import java.nio.charset.Charset;

public class Add {

  public static void main(String[] args) {
    BigDecimal a = BigDecimal.ZERO;
    BigDecimal b = BigDecimal.ZERO;
    try (BufferedReader br = Files.newBufferedReader(Paths.get(args[0]), Charset.defaultCharset());) {
      for (String line; (line = br.readLine()) != null;) {
        String[] tokens = line.split(",");
        a = a.add(new BigDecimal(tokens[0]));
        b = b.add(new BigDecimal(tokens[1]));
      }
      System.out.print(a);
      int c = a.compareTo(b);
      System.out.print(c < 0 ? " < " : (c > 0 ? " > " : " = "));
      System.out.println(b);
    } catch (IOException ex) {
      ex.printStackTrace();
    }
  }
}
