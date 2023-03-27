/// print 2d array
void printList(List<List<int>> l) {
  final y = l.length;
  final x = l.first.length;

  for (int i = 0; i < y; i++) {
    final buffer = StringBuffer();
    for (int j = 0; j < x; j++) {
      buffer.write((l[i][j]));
    }
    print(buffer.toString());
  }
}
