class Solution {
  bool validateStackSequences(List<int> pushed, List<int> popped) {
    final s = [];
    int i = 0;
    int j = 0;
    int ilen = pushed.length;
    int jlen = pushed.length;

    while (i < ilen) {
      s.add(pushed[i++]);

      while (s.isNotEmpty) {
        if (popped[j] == s.last) {
          s.removeLast();
          j++;
        } else {
          break;
        }
      }
    }
    return j >= jlen;
  }
}
