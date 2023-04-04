class Solution {
  int partitionString(String s) {
    final lastSeen = List<int>.generate(26, (index) => -1);
    int count = 1, substringStart = 0;

    final d = 'a'.codeUnits.first;

    for (int i = 0; i < s.codeUnits.length; i++) {
      final ch = s.codeUnits[i];

      if (lastSeen[ch - d] >= substringStart) {
        count++;
        substringStart = i;
      }
      lastSeen[ch - d] = i;
    }

    return count;
  }
}
