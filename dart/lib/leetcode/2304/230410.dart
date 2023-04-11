class Solution {
  bool isValid(String s) {
    if (s.length % 2 > 0) {
      return false;
    }
    final open = "([{".codeUnits;
    final close = ")]}".codeUnits;
    List<int> stack = [];

    for (int ch in s.codeUnits) {
      final inOpen = open.indexOf(ch);
      final inClose = close.indexOf(ch);

      if (inClose != -1) {
        if (stack.isEmpty) {
          return false;
        }
        final l = stack.last;
        if (open.indexOf(l) == inClose) {
          stack.removeLast();
        } else {
          return false;
        }
      } else if (inOpen != -1) {
        stack.add(ch);
      }
    }
    return stack.isEmpty;
  }
}
