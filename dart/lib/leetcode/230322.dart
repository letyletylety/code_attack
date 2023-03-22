import 'dart:collection';

class Solution {
  int minScore(int n, List<List<int>> roads) {
    List<Map<int, int>> newRoad = List.generate(n + 1, (index) => <int, int>{});
    // 정리
    for (var road in roads) {
      // 1,2,3
      newRoad[road[0]][road[1]] = road[2];
      newRoad[road[1]][road[0]] = road[2];
    }

    int ret = 1231123123123;
    Set connected = {};
    Queue queue = Queue();
    queue.add(1);
    while (queue.isNotEmpty) {
      final t = queue.removeFirst();
      if (connected.contains(t)) {
        continue;
      }

      connected.add(t);

      for (var road in newRoad[t].entries) {
        queue.add(road.key);
      }
    }

    for (var element in connected) {
      for (var v in (newRoad[element].values)) {
        if (v < ret) ret = v;
      }
    }

    print(connected);

    return ret;
  }
}
