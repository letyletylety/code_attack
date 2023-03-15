import 'package:dart/leetcode/230315.dart';
import 'package:dart/leetcode/main.dart';
import 'package:test/test.dart';

void main() {
  test('230315 ...', () async {
    final maker = TreeNodeMaker([1, 2, 3, 4, 5, null, 7]);
    final root = maker.makeTreeNode();

    print(root);
    final sol = Solution();
    final v = sol.isCompleteTree(root);
    print(v);
  });
}
