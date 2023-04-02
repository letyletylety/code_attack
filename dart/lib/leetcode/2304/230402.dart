class Solution {
  List<int> successfulPairs(List<int> spells, List<int> potions, int success) {
    potions.sort((a, b) => b - a);

    List<int> ret = [];
    for (var element in spells) {
      final th = success / element;

      int left = 0;
      int right = potions.length;
      for (; left < right;) {
        final mid = (left + right) ~/ 2;

        if (th <= potions[mid]) {
          left = mid + 1;
        } else {
          right = mid;
        }
        // print('$left $right');
      }

      ret.add(left);
    }
    return ret;
  }
}

void main(List<String> args) {
  final spells = [5, 1, 3];
  final potions = [1, 2, 3, 4, 5];
  final success = 7;
  final ret = Solution().successfulPairs(spells, potions, success);
  print(ret);
}
