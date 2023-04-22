import 'dart:math';

class Solution {
  int minInsertions(String s) {
    final n = s.length;
    final dp = List.generate(
      n + 10,
      (index) => List.generate(n + 10, (_) => -1),
    );

    bool isPal(int i, int j) {
      int left = i;
      int right = j;
      while (left <= right) {
        if (s[left] != s[right]) return false;
        left++;
        right--;
      }
      return true;
    }

    int d(int i, int j) {
      if (i == j) return 0;
      if (isPal(i, j)) {
        return 0;
      }

      if (dp[i][j] != -1) {
        return dp[i][j];
      }

      dp[i][j] = min(d(i + 1, j) + 1, d(i, j - 1) + 1);
      if (s[i] == s[j]) {
        dp[i][j] = min(dp[i][j], d(i + 1, j - 1));
      }
      return dp[i][j];
    }

    return d(0, n - 1);
  }
}
