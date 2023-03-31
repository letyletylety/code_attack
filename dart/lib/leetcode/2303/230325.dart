import 'dart:collection';

class Solution {
  int countPairs(int n, List<List<int>> edges) {
    final graph = List<Set<int>>.generate(n, (index) => {});

    for (final e in edges) {
      final u = e[0];
      final v = e[1];

      graph[u].add(v);
      graph[v].add(u);
    }

    int groupCount = 0;
    int groupedPairCount = 0;
    final bigVisited = <int>{};

    for (int root = 0; root < n; root++) {
      if (bigVisited.contains(root)) continue;
      groupCount++;

      final thisTimeVisited = <int>{};
      final q = Queue();
      q.add(root);

      while (q.isNotEmpty) {
        final t = q.removeFirst();
        if (thisTimeVisited.contains(t)) {
          continue;
        }

        thisTimeVisited.add(t);
        bigVisited.add(t);

        for (int v in graph[t]) {
          q.add(v);
        }
      }

      groupedPairCount +=
          (thisTimeVisited.length ) * (thisTimeVisited.length - 1) ~/ 2;
    }

    return (n - 1) * n ~/ 2 - groupedPairCount;
  }
}
