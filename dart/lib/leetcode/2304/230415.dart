import 'dart:math';

class Solution {
  late List<List<int>> dp;
  late int n;
  // late List<List<int>> piles;
  late List<List<int>> psum;

  int maxValueOfCoins(List<List<int>> piles, int k) {
    n = piles.length;
    dp = List.generate(n + 1, (index) => List.generate(k + 1, (index) => -1));
    // this.piles = piles;

    psum = List.generate(
        n, (i) => List.generate(piles[i].length + 1, (index) => 0));

    for (int i = 0; i < n; i++) {
      var pilen = piles[i].length;
      for (int j = 1; j <= pilen; j++) {
        psum[i][j] = psum[i][j - 1] + piles[i][j - 1];
      }
    }
    int d(int i, int kk) {
      if (kk == 0) return 0;
      if (dp[i][kk] != -1) return dp[i][kk];

      if (i == 0) {
        if (piles[i].length < kk) {
          return -1;
        } else {
          return psum[i][kk];
        }
      }

      final ll = min(kk, piles[i].length);
      for (int j = 0; j <= ll; j++) {
        dp[i][kk] = max(dp[i][kk], d(i - 1, kk - j) + psum[i][j]);
      }
      return dp[i][kk];
    }

    return d(n - 1, k);
  }
}
