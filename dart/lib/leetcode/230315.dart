import 'main.dart';
import 'dart:collection';

class Solution {
  final leaves = <int>[];

  bool isCompleteTree(TreeNode? root) {
    if (root == null) {
      return true;
    }

    bool nullNodeFound = false;
    final q = Queue<TreeNode?>();
    q.add(root);

    while (q.isNotEmpty) {
      TreeNode? node = q.removeFirst();

      if (node == null) {
        nullNodeFound = true;
      } else {
        if (nullNodeFound) {
          return false;
        }
        q.add(node.left);
        q.add(node.right);
      }
    }
    return true;
  }
}
