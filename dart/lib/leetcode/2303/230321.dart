class Solution {
  int zeroFilledSubarray(List<int> nums) {
    int ret = 0;

    bool inZeroArray = false;
    int tempCnt = 0;

    for (var element in nums) {
      if (element == 0) {
        if (inZeroArray) {
          // 000 0
          tempCnt++;
        } else {
          // 123 0
          inZeroArray = true;
          tempCnt = 1;
        }
        ret += tempCnt;
      } else {
        if (inZeroArray) {
          // 000 2
          inZeroArray = false;
          tempCnt = 0;
        } else {
          // 123 4
        }
      }
    }

    return ret;
  }

  /// 현재 [len]만큼 연속된 0 이 있을 때
  /// **추가되는** subarray 의 개수
  int countWay(int len) {
    return len;
  }
}
