import 'dart:collection';

class Solution {
  int makeConnected(int n, List<List<int>> connections) {
    List<Set<int>> graph = List.generate(n + 1, (index) => {});

    for (var edge in connections) {
      final u = edge[0];
      final v = edge[1];
      graph[u].add(v);
      graph[v].add(u);
    }

    List<int> parent = List.generate(n, (index) => -1);

    for (int root = 0; root < n; root++) {
      if (parent[root] != -1) {
        continue;
      }

      final q = Queue();
      q.add(root);

      while (q.isNotEmpty) {
        final t = q.removeFirst();
        if (parent[t] != -1) {
          continue;
        }
        parent[t] = root;

        for (int v in graph[t]) {
          q.add(v);
        }
      }
    }

    final List<List<int>> parentCount = List.generate(n, (index) => []);

    for (int i = 0; i < n; i++) {
      parentCount[parent[i]]!.add(i);
    }

    final groups = parentCount.where((element) => element.isNotEmpty);

    int cableNeed = groups.length - 1;

    ///남는 케이블
    int remainCable = 0;

    for (List<int> count in groups) {
      final cableNeedInThisGroup = count.length - 1;

      int wholeCables = 0;

      for (var e in count) {
        wholeCables += graph[e].length;
      }

      /// 양방향
      wholeCables ~/= 2;

      remainCable += wholeCables - cableNeedInThisGroup;
    }

    if (cableNeed > remainCable) {
      return -1;
    } else {
      return cableNeed;
    }
  }
}
