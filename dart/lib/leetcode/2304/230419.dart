import 'package:dart/leetcode/helpers/treenode.dart';

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

class Solution {
  int longestZigZag(TreeNode? root) {
    int ret = 0;

    void f(TreeNode? root, int left, int right) {
      if (root != null) {
        ret = max(ret, max(left, right));
        f(root.left, right + 1, 0);
        f(root.right, 0, left + 1);
      }
    }

    f(root, 0, 0);
    return ret;
  }
}
