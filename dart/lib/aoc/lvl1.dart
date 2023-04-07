import 'dart:async';
import 'dart:io';

abstract class Level {
  FutureOr solve();
}

class Level1 implements Level {
  @override
  solve() async {
    final f = File('resources/aoc/lvl1.txt');
    final lines = await f.readAsLines();

    int ret = 0;
    int temp = 0;

    for (final String line in lines) {
      if (line == '') {
        if (ret < temp) ret = temp;
        temp = 0;
      } else {
        temp += int.parse(line);
      }
    }
    return ret;
  }
}
