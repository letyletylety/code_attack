class Solution {
  int longestCycle(List<int> edges) {
    final n = edges.length;
    List<List<int>> took = List.generate(
        n, (index) => [0, 0]); // did we take the outgoing edge from i?
    int ans = -1;

    for (int node = 0; node < n; ++node) {
      int len = 1, cur = node;

      while (cur != -1 && took[cur][1] == 0) {
        took[cur] = [node, len++];
        cur = edges[cur];
      }
      if (cur != -1 && took[cur].first == node) {
        var i = len - took[cur][1];
        if (ans < i) ans = i;
      }
    }
    return ans;
  }
}
