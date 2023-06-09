class Solution {
  int addDigits(int num) {
    while (num >= 10) {
      num = toADigit(num);
    }
    return num;
  }

  int toADigit(int num) {
    int sum = 0;
    while (num > 0) {
      sum += num % 10;
      num ~/= 10;
    }
    return sum;
  }
}
