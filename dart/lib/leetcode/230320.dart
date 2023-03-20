class Solution {
  bool canPlaceFlowers(List<int> flowerbed, int n) {
    final noflowerzone = <int>{};

    for (int i = 0; i < flowerbed.length; i++) {
      var element = flowerbed[i];

      if (element == 1) {
        noflowerzone.add(i - 1);
        noflowerzone.add(i);
        noflowerzone.add(i + 1);
      }
    }

    int cnt = 0;
    for (int j = 0; j < flowerbed.length; j++) {
      if (!noflowerzone.contains(j)) {
        cnt++;
        j++;
      }
    }

    return cnt >= n;
  }
}
