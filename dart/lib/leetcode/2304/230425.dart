import 'dart:collection';

class SmallestInfiniteSet {
  SmallestInfiniteSet() {
    pq = SplayTreeSet();
  }

  late SplayTreeSet<int> pq;

  int i = 1;

  int popSmallest() {
    // print(pq._heap);
    if (pq.isEmpty) {
      return i++;
    } else {
      final f = pq.first;

      if (f < i) {
        pq.remove(f);
        return f;
      } else if (f == i) {
        pq.remove(f);
        i++;
        return f;
      } else {
        return i++;
      }
    }
  }

  void addBack(int num) {
    pq.add(num);
  }
}

