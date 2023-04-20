import '../helpers/treenode.dart';

import 'dart:collection';
import 'dart:math';

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */

class NodeINfo {
  final TreeNode? treeNode;
  final int level;
  final int pos;

  NodeINfo(this.treeNode, this.level, this.pos);
}

class Solution {
  int widthOfBinaryTree(TreeNode? root) {
    final levelLastMeet = List.generate(3010, (index) => -1);
    final levelFirstMeet = List.generate(3010, (index) => -1);

    final q = Queue<NodeINfo>();
    q.add(NodeINfo(root, 0, 0));

    while (q.isNotEmpty) {
      final t = q.removeFirst();
      if (t.treeNode == null) continue;

      if (levelFirstMeet[t.level] == -1) {
        levelFirstMeet[t.level] = t.pos;
      }
      levelLastMeet[t.level] = t.pos;

      q.add(NodeINfo(t.treeNode!.left, t.level + 1, t.pos * 2));
      q.add(NodeINfo(t.treeNode!.right, t.level + 1, t.pos * 2 + 1));
    }

    int ret = 0;
    for (int i = 0; i < 3000; i++) {
      ret = max(ret, levelLastMeet[i] - levelFirstMeet[i] + 1);
    }
    return ret;
  }
}
