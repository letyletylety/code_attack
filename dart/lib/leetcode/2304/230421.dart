class Solution {
  int profitableSchemes(
      int n, int minProfit, List<int> group, List<int> profit) {
    const int mod = 1000000007;
    final len = group.length;

    final dp = List.generate(
      110,
      (_) => List.generate(
        110,
        (_) => List.generate(110, (_) => -1),
      ),
    );

    int f(int left, int curProfit, int i) {
      if (curProfit >= 110) {
        return f(left, minProfit, i);
      }

      if (i == len) {
        if (curProfit >= minProfit) {
          return 1;
        } else {
          return 0;
        }
      }

      if (dp[left][curProfit][i] != -1) {
        return dp[left][curProfit][i];
      }

      int ret = f(left, curProfit, i + 1) % mod;
      if (left >= group[i]) {
        ret += f(left - group[i], curProfit + profit[i], i + 1) % mod;
      }
      ret %= mod;
      dp[left][curProfit][i] = ret;
      return ret;
    }

    return f(n, 0, 0);
  }
}
