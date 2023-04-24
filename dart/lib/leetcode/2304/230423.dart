class Solution {
  int numberOfArrays(String s, int k) {
    final n = s.length;
    final d = List.generate(n, (index) => -1);
    final mod = 1000000007;

    int dp(int i) {
      if (i == n) return 1;

      if (d[i] != -1) return d[i];

      if (s[i] == '0') {
        return 0;
      }

      int ret = 0;

      for (int j = 1; j <= 10; j++) {
        if (i + j > n) break;
        final candi = s.substring(i, i + j);
        final l = int.parse(candi);

        if (l <= k) {
          ret += dp(i + j) % mod;
        } else {
          break;
        }
      }

      d[i] = ret % mod;
      return d[i];
    }

    return dp(0);
  }
}
