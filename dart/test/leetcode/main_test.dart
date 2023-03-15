import 'package:dart/leetcode/main.dart';
import 'package:test/test.dart';

void main() {
  test('main ...', () async {
    final maker = TreeNodeMaker(
      [1, 2, 3, 4, 5, null, 7],
    );

    final node = maker.makeTreeNode();
    print(node);
  });
}
