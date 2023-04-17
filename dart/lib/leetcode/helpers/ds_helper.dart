List<List<List>> tripleNestedList(int len, [dynamic defaultValue = 0]) {
  return List.generate(
    len,
    (_) => List.generate(
      len,
      (_) => List.generate(len, (_) => defaultValue),
    ),
  );
}

List<List<List>> tripleNestedListWithSize(int z, int y, int x,
    {dynamic defaultValue = 0}) {
  return List.generate(
    z,
    (_) => List.generate(
      y,
      (_) => List.generate(x, (_) => defaultValue),
    ),
  );
}

/// get maximum value in the list
int maxInList(List<int> candies) {
  int ret = -1234567890;
  for (int i = 0; i < candies.length; i++) {
    if (ret < candies[i]) {
      ret = candies[i];
    }
  }
  return ret;
}
