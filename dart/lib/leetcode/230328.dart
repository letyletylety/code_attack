import 'dart:math';

class Solution {
  late List<int> _days;
  late List<int> _costs;
  late int len;
  final List<int> duration = [1, 7, 30];

  final mem = <int, int>{};

  int mincostTickets(List<int> days, List<int> costs) {
    _days = days;
    _costs = costs;

    len = days.length;

    return dp(0);
  }

  int dp(i) {
    if (i >= len) return 0;

    if (mem.containsKey(i)) {
      return mem[i]!;
    }

    int ans = 1231231231231;

    int j = i;

    for (int k = 0; k < 3; k++) {
      while (j < len && _days[j] < _days[i] + duration[k]) {
        j++;
      }
      ans = min(ans, dp(j) + _costs[k]);
    }
    mem[i] = ans;
    return ans;
  }
}
