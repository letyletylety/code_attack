import 'dart:math';

class Solution {
  late final int n;
  late final List<List<int>> dp;
  late final String ss;

  int longestPalindromeSubseq(String s) {
    ss = s;
    n = s.length;

    dp = List.generate(n, (index) => List.generate(n, (_) => -1));

    return d(0, n - 1);
  }

  // s[i..j]
  int d(int i, int j) {
    if (i == j) {
      return 1;
    }
    if (j == i + 1) {
      return 1 + ((ss[i] == ss[j]) ? 1 : 0);
    }

    if (dp[i][j] != -1) {
      return dp[i][j];
    }

    int ret = -1;

    if (ss[i] == ss[j]) {
      ret = max(ret, d(i + 1, j - 1) + 2);
    }

    ret = max(ret, max(d(i + 1, j), d(i, j - 1)));
    dp[i][j] = ret;
    return dp[i][j];
  }
}
