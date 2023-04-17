import 'dart:math';

class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    final ret = candies.reduce(max);
    final l = List.filled(candies.length, false);
    for (int i = 0; i < l.length; i++) {
      l[i] = candies[i] + extraCandies >= ret;
    }
    return l;
  }
}
