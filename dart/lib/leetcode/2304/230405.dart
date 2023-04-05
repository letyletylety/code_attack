import 'dart:math';

class Solution {
  int minimizeArrayValue(List<int> nums) {
    int answer = 0;
    int psum = 0;

    for (int i = 0; i < nums.length; i++) {
      psum += nums[i];
      answer = max(answer, (psum / (i + 1)).ceil());
    }
    return answer;
  }
}
