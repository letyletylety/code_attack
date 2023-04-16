class Solution {
  int numWays(List<String> words, String target) {
    int wll = words.first.length;
    int tl = target.length;
    int MOD = 1000000007;
    final dp = List.generate(wll, (index) => List.generate(tl, (index) => -1));

    int d(int i, int j) {
      if (j == tl) return 1;

      if (tl - j > wll - i) {
        return 0;
      }

      if (dp[i][j] != -1) return dp[i][j];

      dp[i][j] = d(i + 1, j) % MOD;

      for (var word in words) {
        if (word[i] == target[j]) {
          dp[i][j] += d(i + 1, j + 1) % MOD;
          dp[i][j] %= MOD;
        }
      }

      return dp[i][j];
    }

    return d(0, 0);
  }
}
