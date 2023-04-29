List<List<List>> tripleNestedList(int len, [dynamic defaultValue = 0]) {
  return List.generate(
    len,
    (_) => List.generate(
      len,
      (_) => List.generate(len, (_) => defaultValue),
    ),
  );
}

List<List<List>> tripleNestedListWithSize(int z, int y, int x,
    {dynamic defaultValue = 0}) {
  return List.generate(
    z,
    (_) => List.generate(
      y,
      (_) => List.generate(x, (_) => defaultValue),
    ),
  );
}

/// get maximum value in the list
int maxInList(List<int> candies) {
  int ret = -1234567890;
  for (int i = 0; i < candies.length; i++) {
    if (ret < candies[i]) {
      ret = candies[i];
    }
  }
  return ret;
}

/// pq
class PriorityQueue<T> {
  List<T> _heap;
  final Comparator<T> _comparator;

  PriorityQueue(this._comparator) : _heap = <T>[];

  bool isEmpty() => length == 0;
  bool isNotEmpty() => length > 0;

  void add(T element) {
    _heap.add(element);
    _bubbleUp(_heap.length - 1);
  }

  T? removeFirst() {
    if (_heap.isEmpty) {
      return null;
    }
    final result = _heap.first;
    final lastElement = _heap.removeLast();
    if (_heap.isNotEmpty) {
      _heap[0] = lastElement;
      _bubbleDown(0);
    }
    return result;
  }

  T? get first {
    if (_heap.isEmpty) {
      return null;
    }
    return _heap.first;
  }

  int get length => _heap.length;

  void _bubbleUp(int index) {
    if (index == 0) {
      return;
    }
    final parentIndex = (index - 1) ~/ 2;
    if (_comparator(_heap[parentIndex], _heap[index]) > 0) {
      _swap(parentIndex, index);
      _bubbleUp(parentIndex);
    }
  }

  void _bubbleDown(int index) {
    final leftChildIndex = 2 * index + 1;
    final rightChildIndex = 2 * index + 2;
    var smallestChildIndex = index;
    if (leftChildIndex < _heap.length &&
        _comparator(_heap[leftChildIndex], _heap[smallestChildIndex]) < 0) {
      smallestChildIndex = leftChildIndex;
    }
    if (rightChildIndex < _heap.length &&
        _comparator(_heap[rightChildIndex], _heap[smallestChildIndex]) < 0) {
      smallestChildIndex = rightChildIndex;
    }
    if (smallestChildIndex != index) {
      _swap(smallestChildIndex, index);
      _bubbleDown(smallestChildIndex);
    }
  }

  void _swap(int i, int j) {
    final temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

/// a.k.a. dsu
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
