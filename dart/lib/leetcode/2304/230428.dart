class Solution {
  int numSimilarGroups(List<String> strs) {
    int n = strs.length;
    Map<int, List<int>> adj = {};
    // Form the required graph from the given strings array.
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        if (isSimilar(strs[i], strs[j])) {
          adj.putIfAbsent(i, () => adj[i] = []).add(j);
          adj.putIfAbsent(j, () => adj[j] = []).add(i);
        }
      }
    }

    List<bool> visit = List.filled(n, false);
    int count = 0;
    // Count the number of connected components.
    for (int i = 0; i < n; i++) {
      if (!visit[i]) {
        dfs(i, adj, visit);
        count++;
      }
    }

    return count;
  }

  void dfs(int node, Map<int, List<int>> adj, List<bool> visit) {
    visit[node] = true;
    if (!adj.containsKey(node)) {
      return;
    }

    for (var neighbor in adj[node]!) {
      if (!visit[neighbor]) {
        visit[neighbor] = true;
        dfs(neighbor, adj, visit);
      }
    }
  }

  bool isSimilar(String a, String b) {
    int diff = 0;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        diff++;
      }
    }
    return diff == 0 || diff == 2;
  }
}
