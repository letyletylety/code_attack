class Solution {
  int maxSatisfaction(List<int> satisfaction) {
    satisfaction.sort((a, b) => b - a);

    var n = satisfaction.length;

    final psum = List<int>.filled(n, 0);

    psum[0] = satisfaction[0];
    for (int i = 1; i < n; i++) {
      psum[i] = psum[i - 1] + satisfaction[i];
    }

    int ret = 0;
    int temp = 0;
    for (int i = 0; i < n; i++) {
      temp += psum[i];
      if (temp > ret) {
        ret = temp;
      }
    }
    return ret;
  }
}

main() {
  Solution().maxSatisfaction([2, 3, 1, 4, 5, 0]);
}
