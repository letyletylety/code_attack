import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class TreeNodeMaker {
  final List list;

  TreeNodeMaker(this.list);

  TreeNode? makeTreeNode() {
    if (list.isEmpty) return null;

    TreeNode? result = _makerHelper(0, 0);
    return result;
  }

  TreeNode? _makerHelper(int index, int depth) {
    final jump = 1 << depth;

    if (index >= list.length) return null;

    if (list[index] == null) {
      return null;
    }

    return TreeNode()
      ..val = list[index]
      ..left = _makerHelper(index * 2 + 1, depth + 1)
      ..right = _makerHelper(index * 2 + 2, depth + 1);
  }
}

class TreeNodeConverter {
  final TreeNode? node;

  TreeNodeConverter(this.node);

  List toList() {
    throw UnimplementedError();
    final result = <int?>[];
    final visited = Queue<TreeNode?>();
    if (node == null) return [null];

    result.add(node!.val);
    visited.add(node);

    while (visited.isNotEmpty) {
      final TreeNode? pop = visited.removeFirst();
      if (pop == null) {
        result.add(null);
        continue;
      }
      result.add(pop.val);
      visited.add(pop);
    }

    return result;
  }
}

void main() {
  final maker = TreeNodeMaker(
    [1, 2, 3, 4, 5, null, 7],
  );

  final node = maker.makeTreeNode();
}
