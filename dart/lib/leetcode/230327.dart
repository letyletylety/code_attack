import 'dart:math';

class Solution {
  int minPathSum(List<List<int>> grid) {
    final y = grid.length;
    final x = grid.first.length;

    final g = List.generate(y + 1, (index) => List.generate(x + 1, (i) => 0));

    g[0][0] = grid[0][0];

    for (int i = 1; i < y; i++) {
      g[i][0] = grid[i][0] + g[i - 1][0];
    }

    for (int i = 1; i < x; i++) {
      g[0][i] = grid[0][i] + g[0][i - 1];
    }

    for (int i = 1; i < y; i++) {
      for (int j = 1; j < x; j++) {
        g[i][j] = grid[i][j] + min(g[i - 1][j], g[i][j - 1]);
      }
    }
    final y2 = g.length;
    final x2 = g.first.length;

    for (int i = 0; i < y2; i++) {
      final buffer = StringBuffer();
      for (int j = 0; j < x2; j++) {
        buffer.write((g[i][j]));
      }
      print(buffer.toString());
    }
    return g[y - 1][x - 1];
  }
}
