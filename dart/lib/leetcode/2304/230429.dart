class UnionFind {
  late List<int> group;
  late List<int> rank;

  UnionFind(int size) {
    group = List.filled(size, 0);
    rank = List.filled(size, 0);
    for (int i = 0; i < size; i++) {
      group[i] = i;
    }
  }

  int find(node) {
    if (group[node] != node) {
      group[node] = find(group[node]);
    }
    return group[node];
  }

  void join(int node1, int node2) {
    int group1 = find(node1);
    int group2 = find(node2);

    // node1 and node2 already belong to same group.
    if (group1 == group2) {
      return;
    }

    if (rank[group1] > rank[group2]) {
      group[group2] = group1;
    } else if (rank[group1] < rank[group2]) {
      group[group1] = group2;
    } else {
      group[group1] = group2;
      rank[group2] += 1;
    }
  }

  bool areConnected(int node1, int node2) {
    final group1 = find(node1);
    final group2 = find(node2);
    return group1 == group2;
  }
}

class Solution {
  List<bool> distanceLimitedPathsExist(
      int n, List<List<int>> edgeList, List<List<int>> queries) {
    final uf = UnionFind(n);
    final qc = queries.length;
    final answer = List.filled(qc, false);
    final edges = edgeList;

    // Store original indices with all queries.
    final queriesWithIndex = List<List<int>>.filled(qc, List.empty());
    for (int i = 0; i < qc; i++) {
      queriesWithIndex[i] = queries[i];
      queriesWithIndex[i].add(i);
    }

    edges.sort((a, b) {
      return a[2].compareTo(b[2]);
    });
    queriesWithIndex.sort((a, b) {
      return a[2].compareTo(b[2]);
    });
    // Sort all queries in increasing order of the limit of edge allowed.
    var edgesIndex = 0;

    // Iterate on each query one by one.
    queriesWithIndex.forEach((query) {
      final p = query[0];
      final q = query[1];
      final limit = query[2];
      final queryOriginalIndex = query[3];

      // We can attach all edges which satisfy the limit given by the query.
      while (edgesIndex < edges.length && edges[edgesIndex][2] < limit) {
        final node1 = edges[edgesIndex][0];
        final node2 = edges[edgesIndex][1];
        uf.join(node1, node2);
        edgesIndex += 1;
      }
      // If both nodes belong to the same component, it means we can reach them.
      answer[queryOriginalIndex] = uf.areConnected(p, q);
    });

    return answer;
  }
}
