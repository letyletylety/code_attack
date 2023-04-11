class Solution {
  String removeStars(String s) {
    final l = <int>[];
    final star = '*'.codeUnits.first;

    for (var ch in s.codeUnits) {
      if (l.isEmpty) {
        l.add(ch);
      } else if (ch == star) {
        final last = l.last;
        if (last != star) {
          l.removeLast();
        } else {
          l.add(ch);
        }
      } else {
        final last = l.last;
        if (last == star) {
          l.removeLast();
        } else {
          l.add(ch);
        }
      }
    }
    return String.fromCharCodes(l);
  }
}
