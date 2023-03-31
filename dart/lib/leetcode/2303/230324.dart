import 'dart:collection';

class Solution {
  int minReorder(int n, List<List<int>> connections) {
    int ret = 0;

    final roads = List<Map<int, int>>.generate(n, (index) => {});

    for (var e in connections) {
      final u = e.first;
      final v = e.last;
      roads[u][v] = 0;

      /// reverse road
      roads[v][u] = 1;
    }

    final visited = <int>{};
    final q = Queue();
    q.add(0);

    while (q.isNotEmpty) {
      final t = q.removeLast();
      visited.add(t);

      for (MapEntry<int, int> element in roads[t].entries) {
        final v = element.key;
        final cost = element.value;

        /// 이미 방문한 곳
        if (visited.contains(v)) {
          continue;
        }

        q.add(v);
        ret += cost;
      }
    }

    return n - 1 - ret;
  }
}
