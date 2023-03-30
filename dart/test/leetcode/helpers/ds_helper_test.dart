import 'package:dart/leetcode/helpers/ds_helper.dart';
import 'package:test/test.dart';

void main() {
  test('ds helper ...', () async {
    final td = List.generate(
    3,
    (_) => List.generate(
      3,
      (_) => List.generate(3, (_) {
        if (E == int) {
          return 0 as E;
        } else if (E == double) {
          return 0.0 as E;
        } else if (E == String) {
          return '' as E;
        } else {
          return null as E;
        }
      }),
    ),
  );

    td[0][1][2] = 1;
    print(td);
  });

  test('ds helper ...2', () async {
    final td = tripleNestedList<double>(3);

    td[0][1][2] = 1.0;
    print(td);
  });
  test('ds helper ...3', () async {
    final td = tripleNestedList<String>(3);

    td[0][1][2] = "string";
    print(td);
  });
}
