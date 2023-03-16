import 'main.dart' show TreeNode;

class Solution {
// 1 <= inorder.length <= 3000
// postorder.length == inorder.length
// -3000 <= inorder[i], postorder[i] <= 3000
// inorder and postorder consist of unique values.
// Each value of postorder also appears in inorder.
// inorder is guaranteed to be the inorder traversal of the tree.
// postorder is guaranteed to be the postorder traversal of the tree.
  late List<int> inorder, postorder;

  TreeNode? buildTree(List<int> inorder, List<int> postorder) {
    this.inorder = inorder;
    this.postorder = postorder;

    return _buildTreeHelper(0, inorder.length, 0, postorder.length);
  }

  TreeNode? _buildTreeHelper(int i, int ii, int j, int jj) {
    print('$i $ii, $j $jj');
    if (ii - i == 1 || jj - j == 1) {
      print('skip');
      return TreeNode()..val = postorder[jj - 1];
    }
    if (ii - i == 0 || jj - j == 0) {
      return null;
    }

    TreeNode treeNode = TreeNode();
    final val = postorder[jj - 1];

    print('$val');
    treeNode.val = val;
    // the values are unique
    var found = inorder.indexOf(val, i);

    int newCnt = found - i;

    treeNode.left = _buildTreeHelper(i, found, j, j + newCnt);
    treeNode.right = _buildTreeHelper(found + 1, ii, j + newCnt, jj - 1);
    return treeNode;
  }
}

void main() {
  final inorder = [9, 3, 15, 20, 7];
  final postorder = [9, 15, 7, 20, 3];
  Solution().buildTree(inorder, postorder);
}
