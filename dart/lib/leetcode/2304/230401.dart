class Solution {
  int search(List<int> nums, int target) {
    int left = 0;
    int right = nums.length;

    while (left < right) {
      final mid = (left + right) ~/ 2;

      if (nums[mid] < target) {
        left = mid + 1;
      } else if (nums[mid] > target) {
        right = mid;
      } else {
        return mid;
      }
    }
    return -1;
  }
}
