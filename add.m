$CharacterEncoding = "UTF-8";
(*
解答
問1の解：9007199254740993 > 9007199254740992
問2の解：0 = 0.0
問3の解：1 > 0

実行環境
プラットフォーム：Windows 8.1 64bit
処理系：Mathematica 10.0.1
CPU：Core i7-4700MQ
メモリ：8GB
計算時間（秒）：1

環境構築方法
1. Mathematicaをインストールする。

実行方法
1. ファイル名を「add.m」とする。
2. "C:\Program Files\Wolfram Research\Mathematica\10.0\wolfram.exe" < add.m
*)

(* 「-1.23e-2」のような文字列を「-123/100*10^-2」のような表現に変換するルール *)
parse[str_] := Module[{s, i, f, e},
  {s, i, f, e} = StringCases[str,
     RegularExpression["(-?)(\\d*)\\.?(\\d*)e?(.*)"] -> {"$1", "$2", "$3", "$4"}][[1]];
  If[s == "", 1, -1]*
   (If[i == "", 0, ToExpression[i]] + If[f == "", 0, ToExpression[f]/10^StringLength[f]])*
   10^If[e == "", 0, ToExpression[e]]]

check[file_] := With[{text = Import[file, "Text"]},
  With[{lines = StringSplit[text]},
   With[{strs = Map[StringSplit[#, ","] &, lines]},
    With[{
      a = Total[Map[parse, strs[[;; , 1]]]],
      b = Total[Map[parse, strs[[;; , 2]]]]},
     ToString[a] <> If[a < b, " < ", If[a == b, " = ", " > "]] <> 
      ToString[b]]]]]

Print[check["q1.csv"]];
Print[check["q2.csv"]];
Print[check["q3.csv"]];
