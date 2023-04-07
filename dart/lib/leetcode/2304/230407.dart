import 'dart:collection';

/// advanced problem of 0406
class Solution {
  int numEnclaves(List<List<int>> grid) {
    int ret = 0;
    int m = grid.length;
    int n = grid.first.length;

    const diry = [0, 1, 0, -1];
    const dirx = [1, 0, -1, 0];

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] != 1) {
          // skip
        } else {
          var queue = Queue<MapEntry<int, int>>();
          queue.addLast(MapEntry(i, j));
          bool isLand = true;
          grid[i][j] = 2;

          int temp = 0;

          while (queue.isNotEmpty) {
            final t = queue.removeFirst();

            temp++;
            final y = t.key;
            final x = t.value;

            for (int i = 0; i < 4; i++) {
              final yy = y + diry[i];
              final xx = x + dirx[i];

              if (!(yy >= 0 && yy < m && xx >= 0 && xx < n)) {
                isLand = false;
              } else if (grid[yy][xx] == 1) {
                queue.add(MapEntry(yy, xx));
                grid[yy][xx] = 2;
              }
            }
          }

          if (isLand) {
            ret += temp;
          }
        }
      }
    }

    return ret;
  }
}
