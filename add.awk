#失敗例
BEGIN {
  FS = ",";
  a = 0;
  b = 0;
}
{
  a += $1;
  b += $2;
}
END {
  printf("%e %s %e\n", a, a < b ? "<" : (a > b ? ">" : "="), b);
}
